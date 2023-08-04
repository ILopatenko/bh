#!/bin/bash
#ACTIONS HELPER

source ./_files/helpers/menuContent.sh

source ./_files/helpers/fstab.sh


actionStart(){
   clear -x
   echo
   echo -e "$startActionStyle OK YOU CHOSE TO "$1" $dropStyles"
   echo
   sleep 0.5
}

actionFinish(){
   echo
   echo -e "$finishActionStyle TASK TO "$1" WAS PERFORMED! $dropStyles"
   echo
   sleep 2
}

action(){
   actionStart "$1"
   $2
   actionFinish "$1"
}


updateUpgrade(){
   sudo apt update && sudo apt upgrade -y
}

initialSoftS(){
   sudo apt install git nano htop openssh-server nfs-common wget iperf3 -y
}

initialSoftD(){
   sudo apt install audacious qbittorrent -y
}

updateUpgradeServer(){
   action "$MI01_01" updateUpgrade
   
}

installInitialSoftServer(){
   action "$MI01_02" initialSoftS
}

dockerStack(){
   wget https://gitlab.com/bmcgonag/docker_installs/-/raw/main/install_docker_nproxyman.sh
   chmod +x ./install_docker_nproxyman.sh
   ./install_docker_nproxyman.sh
   rm ./install_docker_nproxyman.sh
}

installDockerStack(){
   action "$MI01_03" dockerStack
}


openRGB(){
   sudo add-apt-repository ppa:thopiekar/openrgb -y
   sudo apt update -y
   sudo apt install openrgb -y
}

installOpenRGB(){
   action "$MI07_01" openRGB
}



#NFS
   #DELL

connectDellIT(){
   action "$MI072_08" $(sudo bash ./_files/helpers/fstab.sh "ssd-it" "$(whoami)")
}

connectDellMEDIA(){
   action "$MI072_07" $(sudo bash ./_files/helpers/fstab.sh "ssd-media" "$(whoami)")
}

   #RYZEN

connectRyzenSHARE(){
   action "$MI072_03" $(sudo bash ./_files/helpers/fstab.sh "r2ter-share" "$(whoami)")
}

connectRyzenMEDIA(){
   action "$MI072_04" $(sudo bash ./_files/helpers/fstab.sh "r2ter-media" "$(whoami)")
}

connectRyzenIT(){
   action "$MI072_05" $(sudo bash ./_files/helpers/fstab.sh "r4ter-it" "$(whoami)")
}

connectAllDell(){
   connectDellIT
   connectDellMEDIA
}

connectAllRyzen(){
   connectRyzenSHARE
   connectRyzenMEDIA
   connectRyzenIT
}

connectAll(){
   connectAllDell
   connectAllRyzen
}



installInitialSoftDesktop(){
   installInitialSoftServer
   action "$MI01_02" initialSoftD

}


bigSoft(){
   wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
   sudo dpkg -i google-chrome-stable_current_amd64.deb
   sudo apt install -f
   rm google-chrome-stable_current_amd64.deb

   sudo apt install wget gpg -y
   wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
   sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
   sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
   rm -f packages.microsoft.gpg
   sudo apt install apt-transport-https -y
   sudo apt update
   sudo apt install code -y

   wget https://zoom.us/client/5.15.3.4839/zoom_amd64.deb
   sudo dpkg -i zoom_amd64.deb
   sudo apt install -f
   rm zoom_amd64.deb

   wget https://downloads.slack-edge.com/releases/linux/4.33.73/prod/x64/slack-desktop-4.33.73-amd64.deb
   sudo dpkg -i slack-desktop-4.33.73-amd64.deb
   sudo apt install -f
   rm slack-desktop-4.33.73-amd64.deb

   sudo curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - && sudo apt-get install -y nodejs
}

installBigSoft(){
   action "$MI02_02" bigSoft
}


existingOracle(){
   clear -x
   echo -e "\n$startActionStyle TRYING TO FIND LAN KEYS $dropStyles"
   echo
   sleep 0.5
   path="/home/$USER/Storage/ssd-it/_SSH-keys/myOracle/$1"
   if [[ -d $path ]]; then
      echo -e "$startActionStyle FOLDER \n$path EXISTS! $dropStyles"
      echo
      sleep 0.5
      keyName=$(find $path -name "*.key")

      if [[ -n $keyName ]]; then
         echo -e "\n$startActionStyle $keyName EXISTS AND NOT AN EMPTY FILE! $dropStyles"
         echo
         sleep 0.5
         chmod 400 $keyName
         serverIP=$(cat $path/ip.txt)
         echo -e "\n$startActionStyle TRYING TO FIND SAVED SERVERS IP $dropStyles"
         echo
         sleep 0.5
         if [[ -n "$path/ip.txt" ]]; then
            echo -e "\n$startActionStyle $path/ip.txt EXISTS AND NOT AN EMPTY FILE! $dropStyles"
            echo
            sleep 0.5
            echo -e "\n$startActionStyle TRYING TO CONNECT TO \n ubuntu@$serverIP WITH $keyName KEY $dropStyles"
            echo
            sleep 0.5
            if [[ $2 == "-hint" ]]; then
               echo
               echo -e "$hint $oracleFirstCommand $dropStyles"
               echo
            fi
            ssh -i $keyName ubuntu@$serverIP
            
         else
            echo -e "\n$startActionStyle $path/ip.txt DOES NOT EXISTS OR AN EMPTY FILE! $dropStyles"
            echo
            sleep 1
            OracleModule
         fi
      else
         echo -e "\n$startActionStyle $path DOES NOT EXISTS OR AN EMPTY FILE! $dropStyles"
         echo
         sleep 1
         OracleModule
      fi
   else
      echo -e "/n$startActionStyle FOLDER $path DOES NOT EXISTS! $dropStyles"
      echo
      sleep 1
      OracleModule
   fi
}




connectToExistingNetmaker(){
   existingOracle "netmaker"
}

connectToExistingNginx(){
   existingOracle "nginx"
}


oracleFirstCommand="
Step 1 - install git and clone bash-helper repo:
sudo apt install git -y
git clone https://github.com/ilopatenko/bh 

Step 2 - login as ROOT:
sudo -i

Step 3 - use this command:
sudo fallocate -l 2048M /root/swapfile && sudo ls -lh /root/swapfile && sudo chmod 600 /root/swapfile && sudo mkswap /root/swapfile && sudo swapon /root/swapfile && sudo echo '/root/swapfile none swap sw 0 0' >> /etc/fstab && sudo apt update && sudo apt upgrade -y && sudo reboot
"

firstConnectionNetmaker(){
   existingOracle "netmaker" "-hint"
}

firstConnectionNginx(){
   existingOracle "nginx" "-hint"
}


installNetmakerServer(){
   sudo wget -qO /root/nm-quick.sh https://raw.githubusercontent.com/gravitl/netmaker/master/scripts/nm-quick.sh && sudo chmod +x /root/nm-quick.sh && sudo /root/nm-quick.sh
}

installNetmakerClient(){
   sudo curl -sL 'https://apt.netmaker.org/gpg.key' | sudo tee /etc/apt/trusted.gpg.d/netclient.asc
   sudo curl -sL 'https://apt.netmaker.org/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/netclient.list
   sudo apt update
   sudo sudo apt install netclient -y
   sudo ip -br -c a
}



