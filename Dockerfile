FROM jenkins/jenkins
MAINTAINER LeeThanh <leethanh21121986@gmail.com>

USER root
RUN apt-get update
USER ${user}

COPY config.xml /usr/share/jenkins/ref/config.xml
COPY jobs /usr/share/jenkins/ref/jobs
COPY secrets /usr/share/jenkins/ref/secrets
COPY users /usr/share/jenkins/ref/users
COPY plugins.txt /usr/share/jenkins/plugins.txt
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/plugins.txt
RUN echo 2.0 > /usr/share/jenkins/ref/jenkins.install.UpgradeWizard.state

ENTRYPOINT ["/bin/tini", "--", "/usr/local/bin/jenkins.sh"]
