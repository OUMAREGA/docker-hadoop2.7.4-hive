FROM bde2020/hadoop-resourcemanager:2.0.0-hadoop2.7.4-java8

RUN sed -i 's/-backports//g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y python3 vim nano