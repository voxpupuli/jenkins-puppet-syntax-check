export PATH=/opt/puppetlabs/puppet/bin/:$PATH

echo Git Diff:

[[ "$OLDSHA" != "0000000000000000000000000000000000000000" ]] && git diff $OLDSHA $NEWSHA

if [[ -d templates ]]
then
    echo
    echo Checking ERB files
    echo

    cat << END > erb.sh
    if [[ -f "\$1" ]]
then
    echo Checking \$1
    erb -P -x -S 0 -T '-' \$1|ruby -c
fi
END

    find templates -name '*.erb' -print0 | xargs -0 -L 1 bash erb.sh

    echo
    echo Checking EPP files
    echo

    find manifests -name '*.pp' -print0 | xargs -0 puppet parser validate --color false --render-as s

fi

if [[ -d lib ]]
then
    echo
    echo Checking RB files
    echo

    find lib -name '*.rb' -print0 | xargs -0 -L 1 ruby -c
fi

if [[ -d manifests ]]
then
    echo
    echo Checking PP files
    echo


    find manifests -name '*.pp' -print0 | xargs -0 puppet parser validate --color false --render-as s
fi

