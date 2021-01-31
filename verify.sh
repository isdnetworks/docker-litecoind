#!/bin/sh
if [ -z $1 ] || [ -z $2 ]; then
	echo "Usage: ${0} litecoin-x.y.z-x86_64-linux-gnu.tar.gz litecoin-0.18.1-linux-signatures.asc"
	exit 1
fi
sha256sum -c $2 2> /dev/null | grep $1
