#!/bin/bash

# A script to check for latest version of camino-node and upgrade to that specific version.
# Keep in mind that this script will downgrade if the latest tagged version lower then the installed one.
#
# This script is designed to be run as root from crontab
#
# Prerequisites for this script:
#  - jq command installed
# 
# Usage:
# camino-node-upgrader.sh -u <username> # where <username> is the user that installed camino-node
#
# Example crontab entry:
# 0 23 * * *       root    /root/camino-node-upgrader.sh -u <username> >> /var/log/camino-node-upgrader.log 2>&1 


unset -v CAMINO_NODE_USERNAME
while getopts 'u:h' opt; do
  case "$opt" in
    u)
      CAMINO_NODE_USERNAME="$OPTARG"
      echo "*** Starting upgrade process for user: $CAMINO_NODE_USERNAME ***"
      echo "*** Date is: `date` ***"
      ;;
   
    ?|h)
      echo "Usage: $(basename $0) -u username"
      exit 1
      ;;
  esac
done
shift "$(($OPTIND -1))"

# Exit if no username is given
if [ -z "$CAMINO_NODE_USERNAME" ]
then 
    echo "Please provide a username with -u option"
    echo "Usage: $(basename $0) -u username"
    exit
fi

if ! id "$CAMINO_NODE_USERNAME" >/dev/null 2>&1; then
    echo "ERROR: User not found: $CAMINO_NODE_USERNAME"
    echo "ERROR: Please provide the username that is used to install camino-node."
    exit
fi

# Check if we are root or have sudo
if ! ((EUID == 0)); then
    echo "ERROR: The script is designed to run as root user. Please run it with sudo prefix."
    exit
fi

# Check if camino-node is installed
if test -f "/etc/systemd/system/camino-node.service"; then
  echo "Found camino-node systemd service..."
else
  echo "ERROR: Can not find camino-node service installed. Please install camino-node to use this upgrade script."
  exit 255
fi

# Check if we have jq
if ! command -v jq &> /dev/null
then
    echo "jq command could not be found"
    echo 'please install jq (on Ubuntu run "apt install jq"'
    exit 1
fi

LATEST_RELEASE_URL="https://api.github.com/repos/chain4travel/camino-node/releases/latest"

echo "Preparing environment..."
foundArch="$(uname -m)"                         #get system architecture
foundOS="$(uname)"                              #get OS
if [ "$foundOS" != "Linux" ]; then
  #sorry, don't know you.
  echo "Unsupported operating system: $foundOS!"
  echo "Exiting."
  exit
fi
if [ "$foundArch" = "aarch64" ]; then
  getArch="arm64"                               #we're running on arm arch (probably RasPi)
  echo "Found arm64 architecture..."
elif [ "$foundArch" = "x86_64" ]; then
  getArch="amd64"                               #we're running on intel/amd
  echo "Found amd64 architecture..."
else
  #sorry, don't know you.
  echo "Unsupported architecture: $foundArch!"
  echo "Exiting."
  exit
fi

# Get latest released version with "latest" tag
echo -n "Checking latest release..."
export LATEST_VERSION=$(wget -q -O - $LATEST_RELEASE_URL \
      | grep tag_name \
      | grep -v "rc\|alpha" \
      | sed 's/.*: "\(.*\)".*/\1/' \
      | head -n 1)

echo " latest camino-node version is: $LATEST_VERSION"

# Get running camino-node's version
echo -n "Getting current running node version..."

# Check if have the current version
if [ -z "$LATEST_VERSION" ]
then 
    echo "ERROR: Can not get the latest version. Exiting..."
    exit 2
fi

export CURRENT_VERSION=$(curl -s -X POST --data '{
    "jsonrpc":"2.0",
    "id"     :1,
    "method" :"info.getNodeVersion"
}' -H 'content-type:application/json;' 127.0.0.1:9650/ext/info | jq  -r ".result.gitVersion")

echo " current running camino-node version is: $CURRENT_VERSION"

# Check if have the current version
if [ -z "$CURRENT_VERSION" ]
then 
    echo "ERROR: Can not get the current running version. Exiting..."
    exit 3
fi

# Do the update if the version does not match the latest version
# Keep in mind that this will downgrade the camino-node version if the latest 
# version is lower then the installed one
if [ "$LATEST_VERSION" != "$CURRENT_VERSION" ]
then
    # Start the upgrade
    echo "Current Node version ($CURRENT_VERSION) is NOT the latest ($LATEST_VERSION)"
    echo "Upgrading camino-node..."
    echo -n "Stopping service..."
    systemctl stop camino-node
    echo "done @`date`"

    # Download and copy node files
    mkdir -p /tmp/camino-node-install               #make a directory to work in
    rm -rf /tmp/camino-node-install/*               #clean up in case previous install didn't
    cd /tmp/camino-node-install

    version=$LATEST_VERSION

    fileName="https://github.com/chain4travel/camino-node/releases/download/$version/camino-node-linux-$getArch-$version.tar.gz"

    if [[ `wget -S --spider $fileName  2>&1 | grep 'HTTP/1.1 200 OK'` ]]; then
        echo "Node version found."
    else
        echo "Unable to find camino-node version $version. Exiting."
        echo -n "Restarting service..."
        systemctl start camino-node
        echo "done @`date`"
      exit
    fi

    echo "Attempting to download: $fileName"
    wget -nv --show-progress $fileName
    echo "Unpacking node files..."
    runuser -l $CAMINO_NODE_USERNAME -c 'mkdir -p $HOME/camino-node'
    runuser -l $CAMINO_NODE_USERNAME -c 'tar xvf /tmp/camino-node-install/camino-node-linux*.tar.gz -C $HOME/camino-node --strip-components=1;'
    rm camino-node-linux-*.tar.gz
    runuser -l $CAMINO_NODE_USERNAME -c 'echo "Node files unpacked into $HOME/camino-node"'

    echo -n "Node upgraded, starting service..."
    systemctl start camino-node
    echo "done @`date`"
    echo "New node version:"
    runuser -l $CAMINO_NODE_USERNAME -c '$HOME/camino-node/camino-node --version'
    echo "Done!"
    exit
else
    echo "Current node version ($CURRENT_VERSION) is the latest ($LATEST_VERSION). Skipping..."
fi
