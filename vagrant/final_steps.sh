APPNAME=$(cat /vagrant/APPNAME)

sudo apt-get install -y python-pip
sudo pip install virtualenv

echo "importing jenkins job for: $APPNAME"
sed "s/APPNAME/$APPNAME/" /vagrant/vagrant/jenkins_job.xml.template > /vagrant/jenkins/jenkins.$APPNAME.xml
cat /vagrant/jenkins/jenkins.$APPNAME.xml | java -jar /vagrant/jenkins/jenkins-cli.jar -s http://localhost:8080/ create-job $APPNAME-development

echo 'done'

