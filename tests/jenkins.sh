# if workspace does not exist, create in root of project dir
if [ -z $WORKSPACE ]; then
    DIR="$( cd "$( dirname "$0" )"/.. && pwd )"
    WORKSPACE=$DIR/workspace
    if [ ! -d $WORKSPACE ]; then
        echo "workspace dir does not exist, creating"
        mkdir $WORKSPACE
        if [ $? -ne 0 ]; then
            exit 1
        fi
    fi
fi

PYENV_HOME=$WORKSPACE/.pyenv/

# Delete previously built virtualenv
if [ -d $PYENV_HOME ]; then
    rm -rf $PYENV_HOME
fi

# Create virtualenv and install necessary packages
virtualenv $PYENV_HOME -p python2.7
. $PYENV_HOME/bin/activate
pip install --quiet nosexcover
pip install --quiet pep8
pip install --quiet pylint
pip install --quiet lettuce

nosetests --with-xcoverage --with-xunit --cover-package=myapp --cover-erase
lettuce --with-xunit tests/
pylint -f parseable myapp/ | tee pylint.out
pep8 myapp | tee pep8.out
