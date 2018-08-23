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

FROM vpgrp/centos:7

RUN \
  yum update -q -y && \
  yum install -q -y \
    yum-utils \
    wget && \
  yum-config-manager --enable epel-testing && \
  yum install -q -y \
    centos-release-scl \
    scl-utils-build && \
  yum groupinstall -q -y 'Development Tools'

RUN \
  yum install -q -y \
    ansible \
    iproute \
    libffi-devel \
    openssl-devel \
    python \
    python-crypto \
    python-devel \
    python-netaddr \
    python-pip \
    python-setuptools \
    rh-ruby24 \
    rh-ruby24-ruby-devel \
    rh-ruby24-rubygems \
    sudo && \
  yum clean all

COPY \
  rh-ruby24.sh /etc/profile.d/rh-ruby24.sh

RUN \
  source /opt/rh/rh-ruby24/enable && \
  export X_SCLS="`scl enable rh-ruby24 'echo $X_SCLS'`" && \
  export PATH=$PATH:/opt/rh/rh-ruby24/root/usr/local/bin && \
  gem install \
    -q --no-rdoc --no-ri --no-format-executable --no-user-install \
    busser rake rubocop yaml-lint bundler rspec serverspec && \
  gem clean && \
  ln -s /opt/rh/rh-ruby24/root/usr/lib64/libruby.so.2.4.3 \
    /usr/lib64/libruby.so.2.4

VOLUME [ "/sys/fs/cgroup" ]

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
