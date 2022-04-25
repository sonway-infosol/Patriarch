#!/bin/bash

clear
PS2="Fetching Blackarch script."
    sleep 1 # The sleep commands are only for timing to add UX.
curl -O https://blackarch.org/strap.sh  # Curl blackarch script.
    sleep 1
echo "Download Complete"
    sleep 2
echo "Verifying integrity..."
    sleep 3
echo 8bfe5a569ba7d3b055077a4e5ceada94119cccef strap.sh | sha1sum -c # Verify the integrity of blackarch.org/strap.sh.
sleep 1
read -rp "Does the output show: 'OK'? (y/n): " shavar # File integrity user input
    if [[ $shavar = y ]] || [[ $shavar = Y ]] || [[ $shavar = yes ]] || [[ $shavar = YES ]] || [[ $shavar = Yes ]] # If user confirms integrity
    then # continue the script.
        clear
        echo "Checking /etc/pacman.conf.."
            sleep 2
        grep -A1 'multilib]' /etc/pacman.conf # Output multilib lines from pacman.conf file.
            sleep 1
        read -rp "Is the [multilib] repo uncommented? (y/n)  " confvar # user input
            if [[ $confvar = y ]] || [[ $confvar = Y ]] || [[ $confvar = yes ]] || [[ $confvar = YES ]] || [[ $confvar = Yes ]] # If user confirms multilib
            then
                clear
                    sleep 1
                echo "Beginning install."
                chmod +x strap.sh # Set strap.sh as executible
                echo # UX spacing
                    sleep 1
                sudo ./strap.sh # run unprivileged strap.sh
                export PS1='1337 H4cKz0R'
                clear
                echo "_________________________________"
                echo
                echo "Please use ethically and legally."
                echo "________________________________"
                echo
                sleep 1
                echo "List All Tools"
                echo "sudo pacman -Sgg | grep blackarch | cut -d' ' -f2 |sort -u"
                echo
                echo "List Tool Categories" 
                echo "sudo pacman -Sg | grep blackarch"
                echo
                echo "Install A Category"
                echo "sudo pacman -S blackarch-<category>"
    elif [[ $shavar != 'y' ]]
    then
        echo
        echo "Corrupt file. Exiting."
        exit #end script
    else
        echo "Try again."
    fi
             else
                echo "Please uncomment the [multilib] repo in /etc/pacman.conf"
                echo "and run black-on.sh again."
                sleep 3
                exit
             fi
