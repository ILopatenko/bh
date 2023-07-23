#!/bin/bash
#ACTIONS HELPER

source ./_files/helpers/menuContent.sh

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