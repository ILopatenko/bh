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