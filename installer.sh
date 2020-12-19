#!/bin/bash

########################
# a script by lazypwny #
########################

## check root

if [[ $(id -u) != 0 ]] ; then
    echo "You Must Have Super User Permissions To Run This File.."
    exit 1
fi

## variables

## F(x)

function netcheck {
        wget -q --spider http://google.com

    if [ $? -eq 0 ]; then
        echo "OnLine [+]"
    else
        echo "OffLine [-]"
        exit 1
    fi
}

## main

if [[ $1 = zenity ]] ; then
    netcheck
    apt update
    apt install -y zenity
    exit
fi

if [[ $1 = msfvenom ]] ; then
    netcheck
    curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
    chmod 755 msfinstall && \
    ./msfinstall
fi

if [[ $1 = xterm ]] ; then
    netcheck
    apt update
    apt install -y xterm
    exit
fi