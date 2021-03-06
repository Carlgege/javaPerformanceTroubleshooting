#!/bin/sh
dir=$(dirname "$0")

## The loadDb.sh script will create 200mb of data in the db/data folder.  
## To change the location, change BASE_DIR environment variable (below)
## to an existing folder where you want the data to be created.

export BASE_DIR=$dir/data
#export BASE_DIR=/Volumes/eto-external-drive/h2/wideData

export H2=$dir/../warProject/target/performanceGolf/WEB-INF/lib/h2-1.4.191.jar

java -cp $H2 org.h2.tools.Server -tcpShutdown tcp://localhost:9092 2>/dev/null


#[-baseDir <dir>]        The base directory for H2 databases (all servers)
#[-ifExists]             Only existing databases may be opened (all servers)
