# Specify the opensciencegrid/compute-entrypoint image tag
ARG IMAGE_BASE_TAG=fresh

FROM opensciencegrid/compute-entrypoint:$IMAGE_BASE_TAG

LABEL maintainer "OSG Software <help@opensciencegrid.org>"

RUN yum install -y --enablerepo=osg-testing \
                   --enablerepo=osg-upcoming-testing \
                   osg-ce-condor && \
    yum clean all && \
    rm -rf /var/cache/yum/

COPY etc/osg/image-config.d/* /etc/osg/image-config.d/
COPY etc/condor/config.d/* /etc/condor/config.d/
COPY usr/local/bin/* /usr/local/bin/
COPY etc/supervisord.d/* /etc/supervisord.d/
