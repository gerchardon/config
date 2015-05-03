#!/bin/bash
function test_repo() {
    URL="$1/dists/$2/Release"
    STATUS=$(curl -o /dev/null -s -w "%{http_code} %{time_total}" $URL)
    echo "Status : $STATUS for $1"
}

# Script to get all the PPA installed on a system
for APT in `find /etc/apt/ -name \*.list`; do
    echo "=== $APT ==="
    grep -Po "(?<=^deb\s).*?(?=#|$)" $APT | (while read ENTRY ; do
        HOST=`echo $ENTRY | cut -d/ -f3`
        USER=`echo $ENTRY | cut -d/ -f4`
        PPA=`echo $ENTRY | cut -d/ -f5`
        #echo sudo apt-add-repository ppa:$USER/$PPA
        if [ "ppa.launchpad.net" = "$HOST" ]; then
            # TODO: ppa impl
            echo "ppa:$USER/$PPA"
            test_repo $ENTRY &
        else
            ENTRY=${ENTRY#\[*\]\ }
            test_repo $ENTRY &
        fi
    done
    wait
    )
done
