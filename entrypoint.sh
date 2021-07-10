#!/bin/sh

# clone the repository
git clone https://${2}@github.com/${3}/${4}.git

# Navigate into the repository root
cd ${4}

# get the latest commit timestamp
timestamp=$(TZ=UTC git show --quiet --date='format-local:%Y%m%d%H%M%S' --format="%cd")
echo $timestamp

# read commit hash from env variable
echo $GITHUB_SHA
commitHash=${GITHUB_SHA:0:12}

# creating snapshot variable
snapshot="$1"-"$timestamp"-"$commitHash"

echo $snapshot

# set the output of the action
echo "::set-output name=SNAPSHOT_VERSION::$snapshot"
