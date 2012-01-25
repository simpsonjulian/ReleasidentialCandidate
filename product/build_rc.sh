#!/bin/bash
workspace=$PWD
export JAVA_HOME=/usr/lib/jvm/java-6-sun
for project in *
do
  if [ -d $project ]; then
    cd $project
    echo "I am in directory ${project}"
    [ -f pom.xml -a -d target ] && mvn clean 
    [ -d .git ] && git pull 
    echo "I am returning to directory ${workspace}"
    cd $workspace
  else
    echo "skipping ${project} as it isn't a directory"
  fi
done

mvn install -Dlicense.failIfMissing=false 
