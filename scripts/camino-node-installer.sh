#!/bin/bash
# Pulls latest pre-built node binary from GitHub and installs it as a systemd service.
# Intended for non-technical validators, assumes running on compatible Ubuntu.

#stop on errors
set -e

#running as root gives the wrong homedir, check and exit if run with sudo.
if ((EUID == 0)); then
    echo "The script is not designed to run as root user. Please run it without sudo prefix."
    exit
fi

#helper function to create camino-node.service file
create_service_file () {
  rm -f camino-node.service
  echo "[Unit]">>camino-node.service
  echo "Description=camino-node systemd service">>camino-node.service
  echo "StartLimitIntervalSec=0">>camino-node.service
  echo "[Service]">>camino-node.service
  echo "Type=simple">>camino-node.service
  echo "User=$(whoami)">>camino-node.service
  echo "WorkingDirectory=$HOME">>camino-node.service
  echo "ExecStart=$HOME/camino-node/camino-node --config-file=$HOME/.caminogo/configs/node.json">>camino-node.service
  echo "LimitNOFILE=32768">>camino-node.service
  echo "Restart=always">>camino-node.service
  echo "RestartSec=1">>camino-node.service
  echo "[Install]">>camino-node.service
  echo "WantedBy=multi-user.target">>camino-node.service
  echo "">>camino-node.service
}

create_config_file () {
  rm -f node.json
  echo "{" >>node.json
  if [ "$ipChoice" = "1" ]; then
    echo "  \"dynamic-public-ip\": \"opendns\",">>node.json
  else
    echo "  \"public-ip\": \"$foundIP\",">>node.json
  fi
  echo "  \"http-host\": \"\"">>node.json
  echo "}" >>node.json
  mkdir -p $HOME/.caminogo/configs
  cp -f node.json $HOME/.caminogo/configs/node.json
}

remove_service_file () {
  if test -f "/etc/systemd/system/camino-node.service"; then
    sudo systemctl stop camino-node
    sudo systemctl disable camino-node
    sudo rm /etc/systemd/system/camino-node.service
  fi
}

#helper function to check for presence of required commands, and install if missing
check_reqs () {
  if ! command -v curl &> /dev/null
  then
      echo "curl could not be found, will install..."
      sudo apt-get install curl -y
  fi
  if ! command -v wget &> /dev/null
  then
      echo "wget could not be found, will install..."
      sudo apt-get install wget -y
  fi
  if ! command -v dig &> /dev/null
  then
      echo "dig could not be found, will install..."
      sudo apt-get install dnsutils -y
  fi
}

#helper function that prints usage
usage () {
  echo "Usage: $0 [--list] [--version <tag>] [--help] [--reinstall]"
  echo ""
  echo "Options:"
  echo "   --help            Shows this message"
  echo "   --list            Lists 10 newest versions available to install"
  echo "   --version <tag>   Installs <tag> version"
  echo "   --reinstall       Run the installer from scratch, overwriting the old service file"
  echo ""
  echo "Run without any options, script will install or upgrade camino-node to latest available version."
  exit 0
}

echo "camino-node installer"
echo "---------------------"

if [ $# -ne 0 ] #arguments check
then
  case $1 in
    --list) #print version list and exit (last 10 versions)
      echo "Available versions:"
      wget -q -O - https://api.github.com/repos/chain4travel/camino-node/releases \
      | grep tag_name \
      | sed 's/.*: "\(.*\)".*/\1/' \
      | head
      exit 0
      ;;
    --version) #explicit version selection
      if [ $# -eq 2 ]
      then
        version=$2
      else
        usage
      fi
      ;;
    --reinstall) #recreate service file and install
      echo "Will reinstall the node."
      remove_service_file
      ;;
    *)
      usage
      ;;
  esac
fi

echo "Preparing environment..."
check_reqs
foundIP="$(dig +short myip.opendns.com @resolver1.opendns.com)"
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
if test -f "/etc/systemd/system/camino-node.service"; then
  foundCaminoNode=true
  echo "Found camino-node systemd service already installed, switching to upgrade mode."
  echo "Stopping service..."
  sudo systemctl stop camino-node
else
  foundCaminoNode=false
fi
# download and copy node files
mkdir -p /tmp/camino-node-install               #make a directory to work in
rm -rf /tmp/camino-node-install/*               #clean up in case previous install didn't
cd /tmp/camino-node-install

version=${version:-latest}
echo "Looking for $getArch version $version..."
if [ "$version" = "latest" ]; then
  fileName="$(curl -s https://api.github.com/repos/chain4travel/camino-node/releases/latest | grep "camino-node-linux-$getArch.*tar\(.gz\)*\"" | cut -d : -f 2,3 | tr -d \" | cut -d , -f 2)"
else
  fileName="https://github.com/chain4travel/camino-node/releases/download/$version/camino-node-linux-$getArch-$version.tar.gz"
fi
if [[ `wget -S --spider $fileName  2>&1 | grep 'HTTP/1.1 200 OK'` ]]; then
  echo "Node version found."
else
  echo "Unable to find camino-node version $version. Exiting."
  if [ "$foundCaminoNode" = "true" ]; then
    echo "Restarting service..."
    sudo systemctl start camino-node
  fi
  exit
fi
echo "Attempting to download: $fileName"
wget -nv --show-progress $fileName
echo "Unpacking node files..."
mkdir -p $HOME/camino-node
tar xvf camino-node-linux*.tar.gz -C $HOME/camino-node --strip-components=1;
rm camino-node-linux-*.tar.gz
echo "Node files unpacked into $HOME/camino-node"
echo
if [ "$foundCaminoNode" = "true" ]; then
  echo "Node upgraded, starting service..."
  sudo systemctl start camino-node
  echo "New node version:"
  $HOME/camino-node/camino-node --version
  echo "Done!"
  exit
fi
echo "To complete the setup, some networking information is needed."
echo "Where is your node running?"
echo "1) Residential network (dynamic IP)"
echo "2) Cloud provider (static IP)"
ipChoice="x"
while [ "$ipChoice" != "1" ] && [ "$ipChoice" != "2" ]
do
  read -p "Enter your connection type [1,2]: " ipChoice
done
if [ "$ipChoice" = "1" ]; then
  echo "Installing service with dynamic IP..."
else
  read -p "Detected '$foundIP' as your public IP. Is this correct? [y,n]: " correct
  if [ "$correct" != "y" ]; then
    read -p "Enter your public IP: " foundIP
    check=false               # ensure its a valid IP
    while [[ $check == false ]]
    do 
       read -p "Invalid IP. Please Enter your public IP: " foundIP
       if [[ $foundIP =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
            check=true
        fi
    done
  fi
  echo "Installing service with public IP: $foundIP"
fi
create_config_file
create_service_file
chmod 644 camino-node.service
sudo cp -f camino-node.service /etc/systemd/system/camino-node.service
sudo systemctl daemon-reload
sudo systemctl start camino-node
sudo systemctl enable camino-node
echo
echo "Done!"
echo
echo "Your node should now be bootstrapping on the main net."
echo "Node configuration file is $HOME/.caminogo/configs/node.json"
echo "To check that the service is running use the following command (q to exit):"
echo "sudo systemctl status camino-node"
echo "To follow the log use (ctrl-c to stop):"
echo "sudo journalctl -u camino-node -f"
echo
echo "Reach us over on https://contact.chain4travel.com if you're having problems."
