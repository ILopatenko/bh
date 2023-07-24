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


#NETMAKER
netmakerClient(){
   sudo curl -sL 'https://apt.netmaker.org/gpg.key' | sudo tee /etc/apt/trusted.gpg.d/netclient.asc
   sudo curl -sL 'https://apt.netmaker.org/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/netclient.list
   sudo apt update
   sudo sudo apt install netclient -y
   sudo ip -br -c a
}

installNetmakerClient(){
   action "$MI01_04" netmakerClient
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