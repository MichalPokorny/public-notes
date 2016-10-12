#!/bin/bash

set -e

cat structured/**/*.ttl > merged.ttl
rm -rf /tmp/fusekidb
mkdir -p /tmp/fusekidb
~/downloads/apache-jena-3.1.0/bin/tdbloader2 --loc /tmp/fusekidb merged.ttl
rm merged.ttl
