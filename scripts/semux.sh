#!/bin/sh

# change work directory
cd "$(dirname "$0")"


 # check if java is installed
 if ! [ -x "$(command -v java)" ]; then
    echo "Error: Java is not installed"
     exit 1
 fi

 # check if java version is correct

version=$(java -version 2>&1 | grep -i version | cut -d'"' -f2 | cut -d'.' -f1-2)
tmp=$(echo "scale=2;$version100" |bc)
version=${tmp%.}
if [ $version -lt "180" ]; then
    echo "Error: Java 8 or above is required"
    exit 1
fi

# start kernel
java -cp "./config:./lib/*" org.semux.Semux $@
