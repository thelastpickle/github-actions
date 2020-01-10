#!/bin/sh -l

TEST_TYPE=$1
CASSANDRA_VERSION=$2
STORAGE_TYPE=$3
GRIM_MIN=$4
GRIM_MAX=$5

sudo update-alternatives --set java /usr/lib/jvm/java-8-openjdk-amd64/jre/bin/java

echo "Test type: ${TEST_TYPE}"
echo "Cassandra Version: ${CASSANDRA_VERSION}"
echo "Storage type: ${STORAGE_TYPE}"
echo "GRIM_MIN: ${GRIM_MIN}"
echo "GRIM_MAX: ${GRIM_MAX}"

./scripts/configure-ccm.sh > /dev/null

./scripts/configure-psql.sh

./scripts/run-tests.sh
