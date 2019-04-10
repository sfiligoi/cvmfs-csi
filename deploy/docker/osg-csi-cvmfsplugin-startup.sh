#!/bin/bash

# OSG cvmfs driver needs /cvmfs/config-osg.opensciencegrid.org mounted
mount -t cvmfs config-osg.opensciencegrid.org /cvmfs/config-osg.opensciencegrid.org
if [ $? -ne 0 ]; then
  echo "Failed to mount config-osg, ABORTING"
  exit 1
fi

# However, we cannot keep it mounted in the CSI module, so make a copy of the essential pieces
mkdir -p /cvmfs/config-osg.opensciencegrid.org.copy
(cd /cvmfs/config-osg.opensciencegrid.org && tar -cf - .) | (cd /cvmfs/config-osg.opensciencegrid.org.copy && tar -xf -)

umount /cvmfs/config-osg.opensciencegrid.org && rmdir /cvmfs/config-osg.opensciencegrid.org
if [ $? -ne 0 ]; then
  echo "Failed to umount config-osg, ABORTING"
  exit 1
fi

mv /cvmfs/config-osg.opensciencegrid.org.copy /cvmfs/config-osg.opensciencegrid.org

# Now we can launch the real CSI process
exec /csi-cvmfsplugin "$@"
