#!/bin/bash

f="openstack-nova.spec"
echo -n "git add: "
git add $f
echo $?

echo -n "git commit: "
git commit -m 'Auto update'
echo $?

echo -n "git push: "
git push
echo $?

echo -n "git pull: "
git pull -Xtheirs
echo $?

echo -n "git push: "
git push
echo $?

