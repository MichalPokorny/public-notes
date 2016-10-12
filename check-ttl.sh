#!/bin/bash

JENA_DIR=~/downloads/apache-jena-3.1.0

set -e

cat structured/**/*.ttl > merged.ttl
rm -rf /tmp/fusekidb
mkdir -p /tmp/fusekidb
$JENA_DIR/bin/tdbloader2 --loc /tmp/fusekidb merged.ttl
rm merged.ttl
