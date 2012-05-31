#!/bin/sh
BASEDIR=$(dirname $0)
cd $BASEDIR
cd ..
ln -s ../../git-hooks/post-commit .git/hooks/post-commit
ln -s ../../git-hooks/pre-commit .git/hooks/pre-commit
