FROM centos:7
LABEL description="CernVM-FS CSI Plugin - OSG based"

RUN yum -y install https://repo.opensciencegrid.org/osg/3.4/osg-3.4-el7-release-latest.rpm && \
    yum -y install epel-release \
                   yum-plugin-priorities && \
    yum -y install cvmfs

RUN yum clean all && rm -rf /var/cache/yum

# OSG version of cvmfs expects config-osg to be mounted
RUN mkdir -p /cvmfs/config-osg.opensciencegrid.org

COPY default.local /etc/cvmfs

COPY csi-cvmfsplugin /csi-cvmfsplugin
RUN chmod +x /csi-cvmfsplugin

COPY osg-csi-cvmfsplugin-startup.sh /osg-csi-cvmfsplugin-startup.sh
RUN chmod +x /osg-csi-cvmfsplugin-startup.sh

ENTRYPOINT ["/osg-csi-cvmfsplugin-startup.sh"]
