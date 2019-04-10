#!/bin/bash
mount -t cvmfs config-osg.opensciencegrid.org /cvmfs/config-osg.opensciencegrid.org
if [ $? -ne 0 ]; then
  echo "Failed to mount config-osg, ABORTING"
  exit 1
fi
exec /csi-cvmfsplugin
