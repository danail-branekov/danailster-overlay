#!/bin/bash

# Viber is a piece of software with quite a crappy delivery process which only provides latest linux binary. 
# This makes it quite hard for Linux distribution package maintainers to keep up with releasing new versions as bumping to a new version has to be done manually


set -x

emerge --unmerge viber

rm -rf /usr/portage/distfiles/viber-9999.deb
rm -rf  /var/lib/layman/danailster-overlay/net-im/viber

ebuild viber-9999.ebuild manifest clean merge
