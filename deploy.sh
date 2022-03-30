#!/bin/bash

if [ -z "${TYPESENSE_API_KEY}" ] ; then
	echo "TYPESENSE_API_KEY must be set before executing this script!"
	exit 1
fi

yarn
yarn build
ssh web@192.168.220.8 rm -rf /var/www/docs.camino.foundation/html/*
scp -r build/* web@192.168.220.8:/var/www/docs.camino.foundation/html/

cd scraper
./execute_scraper.sh
