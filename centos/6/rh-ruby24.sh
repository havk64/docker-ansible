#!/bin/bash

source /opt/rh/rh-ruby24/enable
export X_SCLS="`scl enable rh-ruby24 'echo $X_SCLS'`"
export PATH=$PATH:/opt/rh/rh-ruby24/root/usr/local/bin
