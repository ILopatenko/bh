#!/bin/bash
# BIG SOFT MODULE

source ./_files/helpers/uiMenu.sh
source ./_files/helpers/cliSelector.sh
source ./_files/helpers/menuContent.sh
source ./_files/helpers/actions.sh

source ./_files/pages/wrongSelection.sh
source ./_files/pages/inDevelopment.sh
source ./_files/pages/last.sh




BigSoftModule(){
   uiMenu \
   "$MI04_01" \
   "$MI04_02" \
   "$MI04_03" \
   "$MI04_04" \
   false \
   false \
   false \
   false \
   "$MT04"
   
   cliSelector \
   installDocker \
   installDockerStack \
   installGitLabServer \
   inDevelopment \
   inDevelopment \
   inDevelopment \
   inDevelopment \
   inDevelopment \
   MainModule \
   wrongSelection \
   BigSoftModule
}