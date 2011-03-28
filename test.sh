#!/bin/sh

echo "Bumping Release in specfile"
rpmdev-bumpspec --comment="- rebuilt by Jenkins" openstack-nova.spec

