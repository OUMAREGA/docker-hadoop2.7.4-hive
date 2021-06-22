FROM bde2020/hadoop-namenode:2.0.0-hadoop2.7.4-java8

# Configuration du terminal dans le traitement
# des caractères au format UTF-8
ENV LC_CTYPE C.UTF-8

RUN sed -i 's/-backports//g' /etc/apt/sources.list
RUN apt-get update && apt-get install -y python3 vim nano