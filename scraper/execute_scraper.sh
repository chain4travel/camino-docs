#!/bin/bash

if [ -z "${TYPESENSE_API_KEY}" ] ; then
	echo "TYPESENSE_API_KEY must be set before executing this script!"
	exit 1
fi

ENV_FILE=$(readlink -f env-file)
CONFIG=$(cat docsearch-config.json | jq -r tostring)

docker pull typesense/docsearch-scraper
docker run -it -e"TYPESENSE_API_KEY=${TYPESENSE_API_KEY}"  --env-file=$ENV_FILE -e "CONFIG=$CONFIG" typesense/docsearch-scraper
