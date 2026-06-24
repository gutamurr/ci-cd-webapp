FROM jenkins/jenkins:lts

USER root

COPY plugins.txt /usr/share/jenkins/ref/plugins.txt

RUN apt-get update && apt-get install -y docker.io docker-compose-plugin

RUN jenkins-plugin-cli --plugin-file /usr/share/jenkins/ref/plugins.txt

COPY casc/ /usr/share/jenkins/ref/casc/

ENV CASC_JENKINS_CONFIG=/var/jenkins_home/casc
ENV JAVA_OPTS="-Djenkins.install.runSetupWizard=false"

USER jenkins