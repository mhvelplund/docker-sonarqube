FROM java:8
MAINTAINER Mads Hvelplund "mhv@tmnet.dk"

#### Install the basics
RUN apt-get update
RUN apt-get -y install curl unzip 

### Installation and configuration of SonarQube
RUN curl -O http://dist.sonar.codehaus.org/sonarqube-4.5.zip
RUN unzip sonarqube-4.5.zip -d /opt
RUN	rm sonarqube-4.5.zip

RUN sed -e 's/^#sonar.jdbc.url=jdbc:mysql:\/\/localhost/sonar.jdbc.url=jdbc:mysql:\/\/db/' \
    -e 's/^#sonar.jdbc.username/sonar.jdbc.username/' \
    -e 's/^#sonar.jdbc.password/sonar.jdbc.password/' \
    /opt/sonarqube-4.5/conf/sonar.properties > /opt/sonarqube-4.5/conf/sonar.properties.new
RUN mv /opt/sonarqube-4.5/conf/sonar.properties /opt/sonarqube-4.5/conf/sonar.properties.bak
RUN mv /opt/sonarqube-4.5/conf/sonar.properties.new /opt/sonarqube-4.5/conf/sonar.properties

### Clean
RUN apt-get -y autoclean
RUN apt-get -y clean
RUN apt-get -y autoremove

###Expose ports
EXPOSE 9000

### Start SonarQube
CMD ["/opt/sonarqube-4.5/bin/linux-x86-64/sonar.sh", "console"]