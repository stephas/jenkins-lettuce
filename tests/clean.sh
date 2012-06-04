source $(dirname $0)/ensure_workspace.sh

echo "Cleaning old workspace"
for f in .coverage coverage2.xml coverage.xml lettucetests.xml nosetests.xml pep8.out pylint.out .pyenv; do
    if [ -e $f ]; then
        rm -rf "$f"
    fi
done
