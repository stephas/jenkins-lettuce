# if workspace does not exist, create in root of project dir
if [ -z $WORKSPACE ]; then
    WORKSPACE="$( cd "$( dirname "$0" )"/.. && pwd )"
fi

