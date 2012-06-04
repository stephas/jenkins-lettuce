# if workspace does not exist, create in root of project dir
source $(dirname $0)/ensure_workspace.sh

PYENV_HOME=$WORKSPACE/.pyenv/

# Delete previously built virtualenv
if [ -d $PYENV_HOME ]; then
    rm -rf $PYENV_HOME
fi

# Clean workspace
bash -e tests/clean.sh

# Create virtualenv and install necessary packages
virtualenv $PYENV_HOME -p python2.7
. $PYENV_HOME/bin/activate
pip install --quiet nosexcover
pip install --quiet pep8
pip install --quiet pylint
pip install --quiet lettuce

nosetests --with-xcoverage --with-xunit --cover-package=myapp --cover-erase
coverage run --omit="tests/" $(which lettuce) --with-xunit tests/
coverage xml -o coverage2.xml
pylint -f parseable myapp/ | tee pylint.out
pep8 myapp | tee pep8.out
