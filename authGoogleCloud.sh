#!/bin/bash
 
 cat /Users/srisudhan/workspace/shellScripts/gpstrack-cloud-srisudhan.json |  docker login -u _json_key --password-stdin https://asia-south1-docker.pkg.dev

# docker pull asia-south1-docker.pkg.dev/gpstrack-2/fleettrack/test

## AUTHENTICATE KUBECTL TO USE GCR
kubectl create secret docker-registry gpstrack-cloud-secret \
--docker-server=asia-south1-docker.pkg.dev \
--docker-username=_json_key \
--docker-password="$(cat /Users/srisudhan/workspace/shellScripts/gpstrack-cloud-srisudhan.json)"
