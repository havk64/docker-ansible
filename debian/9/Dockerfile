# Copyright (c) 2018 Vente-Privée
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

FROM vpgrp/debian:stretch as ansible

ENV DEBIAN_FRONTEND="noninteractive" \
    TZ="Europe/Amsterdam"

RUN apt-get update  -qq && \
    apt-get upgrade -qq -y && \
    apt-get install -qq -y \
      build-essential \
      libffi-dev \
      libssl-dev \
      python-dev \
      python-pip \
      python-setuptools \
      python-wheel && \
    apt-clean && \
    pip install --upgrade \
      ansible \
      cryptography

FROM vpgrp/debian:stretch

COPY --from=ansible /usr/local /usr/local

RUN apt-get update  -qq && \
    apt-get upgrade -qq -y && \
    apt-get install -qq -y \
      iproute2 \
      openssh-client \
      python \
      python-netaddr \
      ruby \
      ruby-dev \
      rubygems \
      sudo \
      systemd && \
    apt-clean

WORKDIR /etc/ansible

RUN /bin/echo -e \
      '[local]\nlocalhost ansible_connection=local' > \
      /etc/ansible/hosts

VOLUME [ "/sys/fs/cgroup" ]

HEALTHCHECK NONE
# EOF
