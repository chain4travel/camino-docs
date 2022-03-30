#!/bin/bash

if [ -z "${TYPESENSE_API_KEY}" ] ; then
	echo "TYPESENSE_API_KEY must be exported before executing this script!"
	exit 1
fi

curl 'https://docs.camino.foundation:8108/keys' -X POST -H "X-TYPESENSE-API-KEY: ${TYPESENSE_API_KEY}" \
-H 'Content-Type: application/json' \
-d '{"description":"Search-only camino-docs key.","actions": ["documents:search"], "collections": ["camino-docs"]}'

