#!/bin/bash
workspace=$PWD
export JAVA_HOME=/usr/lib/jvm/java-6-sun
rm -rf ~/.m2/repository/org/neo
for project in *
do
  if [ -d $project ]; then
    cd $project
    [ -d .git ] && git pull 
    hash=$(git rev-parse HEAD)
    echo "${project}: ${hash}" >>${workspace}/manifest
    cd $workspace
  fi
done
export MAVEN_OPTS=-Xmx256m
set -e
mvn install -Dlicense.failIfMissing=false 
packaging="${workspace}/packaging"
zip -j ${workspace}/neo4j_rc.zip ${workspace}/manifest \
${packaging}/standalone/target/neo*
