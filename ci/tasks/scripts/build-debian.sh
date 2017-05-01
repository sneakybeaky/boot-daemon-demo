#!/bin/bash
# vim: set ft=sh

set -e -x

cd boot-daemon
gradle build buildDeb
cp  build/distributions/daemon-demo_0.0.1-1_noarch*.deb ../built-artifact/daemon-demo.deb