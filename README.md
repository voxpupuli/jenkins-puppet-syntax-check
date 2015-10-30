# git update-hook to quickly test Puppet modules

This is a gitolite3 VREF script and a bash script that can together trigger
puppet syntax tests before you can actually push to a module.

![Demo](demo.gif)

## Gitolite

You need to set the token and correct URL to the VREF script.

For more information about VREF, refer the gitolite configuration.

## Jenkins config:

* set the token
* Parameters: REPO, NEWSHA, BRANCH, OLDSHA
* Git repo URL: ssh://git@example.com/$REPO
* Git branches to build: $NEWSHA
* Enable 'Wipe out repository & force clone'
* Enable 'Trigger builds remotely (e.g., from scripts)' (and set the token)
