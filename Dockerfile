FROM tomcat:8.0.20-jre8

COPY target/mvn-job*.war /usr/local/tomcat/webapps/mvn-job.war
