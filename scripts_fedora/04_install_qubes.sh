#!/bin/sh
echo "--> Preparing environment..."
mount -t proc proc $PWD/mnt/proc

echo "--> Installing RPMs..."
export YUM0=$PWD/yum_repo_qubes
yum install -c $PWD/yum.conf $YUM_OPTS -y --installroot=$(pwd)/mnt @qubes-vm || RETCODE=1

echo "--> Installing 3rd party apps"
$SCRIPTSDIR/add_3rd_party_software.sh || RETCODE=1

umount $PWD/mnt/proc

exit $RETCODE
