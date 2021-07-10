#!/bin/bash

#get the timestamp
timestamp=$(date "+%Y%m%d%H%M%S")
echo $timestamp

#read commit hash from env variable
echo $GITHUB_SHA
commithash=${GITHUB_SHA:0:12}

#creating snapshot variable
snapshot="$1"-"$timestamp"-"$commithash"

echo $snapshot

echo "::set-output name=SNAPSHOT_VERSION::$snapshot"
