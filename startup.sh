#!/bin/bash

hadoop fs -mkdir       /tmp
hadoop fs -mkdir -p    /user/hive/warehouse
hadoop fs -chmod g+w   /tmp
hadoop fs -chmod g+w   /user/hive/warehouse
hadoop fs -mkdir -p    /user/hadoop/data
<<<<<<< HEAD
hadoop fs -chmod g+w    /user/hadoop/data
=======
>>>>>>> eab5f4d9537d43c57c6eb216f7cc3e6acb385569

cd $HIVE_HOME/bin
./hiveserver2 --hiveconf hive.server2.enable.doAs=false
