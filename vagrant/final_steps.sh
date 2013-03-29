APPNAME=$(cat /vagrant/APPNAME)

apt-get install -y python-pip
pip install virtualenv

echo "importing jenkins job for: $APPNAME"
sed "s/APPNAME/$APPNAME/" /vagrant/vagrant/jenkins_job.xml.template > /vagrant/jenkins/jenkins.$APPNAME.xml
sleep 10
cat /vagrant/jenkins/jenkins.$APPNAME.xml | java -jar /vagrant/jenkins/jenkins-cli.jar -s http://localhost:8080/ create-job $APPNAME-development

echo 'done'

