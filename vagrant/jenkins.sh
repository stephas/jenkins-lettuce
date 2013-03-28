#!/bin/bash
plugins="cobertura git violations"
# full-blown jdk because headless will not do all the graphing in jenkins...
packages="vim git-core curl openjdk-6-jre screen"

echo 'jenkins install script-----start'
echo 'refreshing packages'
aptitude update > /dev/null
echo "packages to install: $packages"
aptitude install -y $packages > /dev/null
mkdir -p /vagrant/jenkins
cd /vagrant/jenkins
if [ ! -e jenkins.war ]; then
    echo 'downloading jenkins'
    wget -q http://mirrors.jenkins-ci.org/war/latest/jenkins.war
fi
useradd -m -s/bin/bash jenkins
mkdir -p /home/jenkins
chown jenkins:jenkins /home/jenkins
jenkins_cmd='java -jar /vagrant/jenkins/jenkins.war'
jenkins_up=$(ps aux | grep -v grep | grep "${jenkins_cmd}" | wc -l)
if [ $jenkins_up -eq 0 ]; then
    echo "starting jenkins"
    su -l jenkins -c "screen -d -m -- $jenkins_cmd"
else
    echo "jenkins already up"
fi

echo 'waiting for jenkins to be up to download cli locally'
function is_jenkins_up () {
wget http://localhost:8080 -O - -q>/dev/null; echo $?
}
let retry=5
while [ $(is_jenkins_up) -ne 0 -a $retry -gt 0 ]; do
    let retry=retry-1
    sleep 5
    echo "retry$retry"
done
sleep 5
if [ $(is_jenkins_up) -eq 0 -a ! -e /vagrant/jenkins/jenkins-cli.jar ]; then
    echo 'jenkins up successfully'
    echo 'downloading cli'
    wget --no-check-certificate http://localhost:8080/jnlpJars/jenkins-cli.jar -q
    echo "success (0 is good): $?"
fi
echo 'updating update center'
curl -s -L http://updates.jenkins-ci.org/update-center.json | sed '1d;$d' | curl -s -X POST -H 'Accept: application/json' -d @- http://localhost:8080/updateCenter/byId/default/postBack
echo "installing jenkins plugins $plugins"
java -jar /vagrant/jenkins/jenkins-cli.jar -s http://localhost:8080/ install-plugin $plugins
sleep 10 
java -jar /vagrant/jenkins/jenkins-cli.jar -s http://localhost:8080/ safe-restart

echo 'jenkins install script-----done'
