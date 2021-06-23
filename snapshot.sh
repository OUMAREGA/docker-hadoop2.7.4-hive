#!/bin/sh

take()
{
     [ -z $1 ] && echo "Error: snapshot name not provided" && exit 1;
     docker-compose exec namenode bash -c "hdfs dfsadmin -allowSnapshot /user && hdfs dfs -createSnapshot /user $1 && hdfs dfs -copyToLocal /user/.snapshot/$1 /snapshots/"
     
     [ "$?" -eq "0" ] && echo "Snapshot $1 successfully taken";
}

restore()
{

     docker-compose exec namenode bash -c "hdfs dfs -rm -r /user/* && hdfs dfs -copyFromLocal /snapshots/$1/* /user/"

     [ $? -eq 0 ] && echo "Snapshot $1 successfully restored";
}

"$@"

if [ -z $1 ]
then

cat << EOT

-- HDFS snapshot utility --

Usage: ./snapshot.sh [action]

Supported actions are
take <name>	take a snapshot (will be saved de /snapshots)
restore <name>  restore the named snapshot     

EOT
fi
