FROM predicthq/spark-mesos:0.28.2-2.0.0

MAINTAINER Thierry Jossermoz <thierry@predicthq.com>

RUN apt-get update && apt-get install -y unzip python-dev python-pip && apt-get clean && apt-get autoremove && pip install -U pip

RUN wget http://download.elastic.co/hadoop/elasticsearch-hadoop-2.3.3.zip && \
    unzip elasticsearch-hadoop-2.3.3.zip && \
    cp elasticsearch-hadoop-2.3.3/dist/elasticsearch-hadoop-2.3.3.jar /opt/spark/jars/ && \
    rm -rf elasticsearch-hadoop-2.3.3

RUN wget http://central.maven.org/maven2/org/apache/hadoop/hadoop-aws/2.7.2/hadoop-aws-2.7.2.jar && \
    mv hadoop-aws-2.7.2.jar /opt/spark/jars/ && \
    wget http://central.maven.org/maven2/com/amazonaws/aws-java-sdk/1.7.4/aws-java-sdk-1.7.4.jar && \
    mv aws-java-sdk-1.7.4.jar /opt/spark/jars/

