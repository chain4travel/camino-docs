#!/bin/bash

function CRIT {
	echo "Failed step: $1"
	exit 1
}


if [ -z "${TYPESENSE_API_KEY}" ] ; then
	echo "TYPESENSE_API_KEY must be set before executing this script!"
	exit 1
fi

yarn || CRIT "yarn (prepare)"
yarn build || CRIT "build of the documentation"
ssh web@192.168.220.8 rm -rf /var/www/docs.camino.foundation/html/* || CRIT "removing old html files"
scp -r build/* web@192.168.220.8:/var/www/docs.camino.foundation/html/ || CRIT "deploy to server"

cd scraper
./execute_scraper.sh || CRIT "renew scrapper"
