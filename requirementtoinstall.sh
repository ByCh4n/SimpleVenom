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


function debian {
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
}

function arch {
    if [[ $1 = zenity ]] ; then
        netcheck
        pacman --noconfirm -S zenity
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
        pacman --noconfirm -S xterm
        exit
    fi 
}


## system check
if [[ $(command -v apt) != "" ]] ; then
    echo "Debian Based Distro Found.."
    debian "${1}"
elif [[ $(command -v pacman) != "" ]] ; then
    echo "Arch Based Distro Found.."
    arch "${1}"
else
    echo "Unknow Distro.."
    exit 1
    export exit2tool="1"
fi