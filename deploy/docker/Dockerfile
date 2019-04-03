FROM centos:7
LABEL description="CernVM-FS CSI Plugin - OSG based"

RUN yum -y install https://repo.opensciencegrid.org/osg/3.4/osg-3.4-el7-release-latest.rpm && \
    yum -y install epel-release \
                   yum-plugin-priorities && \
    yum -y install cvmfs

RUN yum clean all && rm -rf /var/cache/yum

COPY default.local /etc/cvmfs

COPY csi-cvmfsplugin /csi-cvmfsplugin
RUN chmod +x /csi-cvmfsplugin
ENTRYPOINT ["/csi-cvmfsplugin"]
