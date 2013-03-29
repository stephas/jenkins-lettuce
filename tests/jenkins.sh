APPNAME=$(cat APPNAME)

# if workspace does not exist, create in root of project dir
source $(dirname $0)/ensure_workspace.sh

PYENV_HOME=$WORKSPACE/.pyenv/

# Clean workspace
bash -e tests/clean.sh

# Create virtualenv and install necessary packages
virtualenv $PYENV_HOME -p python2.7
. $PYENV_HOME/bin/activate
pip install --quiet -r requirements.txt

nosetests --with-xcoverage --with-xunit --cover-package=$APPNAME --cover-erase tests/
coverage run --source=$APPNAME $(which lettuce) -v 3 --with-xunit tests/features/
echo $(coverage xml -o coverage2.xml || true)
# if coverage produced empty .xml FIX invalid xml build fail for cobertura
if [ ! -s coverage2.xml ]; then rm coverage2.xml; fi

# recommend style
pylint -f parseable $APPNAME/ | tee pylint.out
pep8 $APPNAME | tee pep8.out
