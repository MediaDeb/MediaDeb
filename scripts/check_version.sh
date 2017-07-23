#!/bin/bash
# Credits to awesome people at stackoverflow for this snippet ;)
vercomp () {
    if [[ $1 == $2 ]]
    then
        return 0
    fi
    local IFS=.
    local i ver1=($1) ver2=($2)
    # fill empty fields in ver1 with zeros
    for ((i=${#ver1[@]}; i<${#ver2[@]}; i++))
    do
        ver1[i]=0
    done
    for ((i=0; i<${#ver1[@]}; i++))
    do
        if [[ -z ${ver2[i]} ]]
        then
            # fill empty fields in ver2 with zeros
            ver2[i]=0
        fi
        if ((10#${ver1[i]} > 10#${ver2[i]}))
        then
            return 1
        fi
        if ((10#${ver1[i]} < 10#${ver2[i]}))
        then
            return 2
        fi
    done
    return 0
}

VERSION=`file $1 | awk 'match($0,/Linux [0-9.]+/) {print substr($0,RSTART,RLENGTH)}' | cut -d" " -f 2`
vercomp $VERSION $2
if [ "$?" -eq "1" ]; then
    echo "ERROR! Binaris compiled by this toolchain require at least kernel $VERSION"
    echo "ERROR! But this device has kernel version $2"
    exit 1
fi
