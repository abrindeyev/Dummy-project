#!/bin/bash

# 1st parameter: path to Jenkins job's workspace

TARBALLSHOME="http://nova.openstack.org/tarballs"
SPECORIG="openstack-nova.spec"
SPECVER=$(grep '^Version:' $SPECORIG | sed 's/^Version:\s\+//')
SPECRELEASE=$(grep '^Release:' $SPECORIG | sed 's/^Release:\s\+//')

# Gathering actual revisions
BUILD=`curl -s $TARBALLSHOME'/?C=M;O=D' | grep $SPECVER | grep bzr | perl -pi -e 's/^.*bzr(\d+).*$/$1/' | head -n 1`
GITREV=`curl -s http://github.com/api/v2/json/commits/list/abrindeyev/openstack-nova-rhel6/master/openstack-nova.spec | perl github_last_commit.pl`

# Gathering our revisions
OURBUILD=$(echo "$SPECRELEASE" | cut -d. -f3 | sed 's/bzr//')
OURREV=$(git log --pretty=format:"%H" -1)

echo "BUILDs : $BUILD vs $OURBUILD"
echo "Commits: $GITREV vs $OURREV"
exit -1
