# Copyright (c) 2018 Vente-Privée, Richar Delaplace
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM vpgrp/centos:6

RUN \
  yum update -q -y && \
  yum install -q -y \
    yum-utils \
    wget && \
  yum install -q -y \
    http://mir01.syntis.net/epel/6/x86_64/epel-release-6-8.noarch.rpm && \
  yum-config-manager --enable epel-testing && \
  yum install -q -y \
    centos-release-scl \
    scl-utils-build && \
  yum groupinstall -q -y 'Development Tools'

RUN \
  yum install -q -y \
    iproute \
    libffi-devel \
    openssl-devel \
    rh-python36 \
    rh-python36-python-devel \
    rh-python36-python-pip \
    rh-python36-python-setuptools \
    rh-ruby24 \
    rh-ruby24-ruby-devel \
    rh-ruby24-rubygems \
    sudo

COPY rh-ruby24.sh /etc/profile.d/rh-ruby24.sh

COPY rh-python36.sh /etc/profile.d/rh-python36.sh

RUN \
  /etc/profile.d/rh-ruby24.sh && \
  /etc/profile.d/rh-python36.sh && \
  /opt/rh/rh-python36/root/usr/bin/pip install --upgrade \
    ansible \
    cryptography \
    netaddr

VOLUME [ "/sys/fs/cgroup" ]