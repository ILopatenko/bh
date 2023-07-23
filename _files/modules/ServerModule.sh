#!/bin/bash
# MAIN MODULE

source ./_files/helpers/uiMenu.sh
source ./_files/helpers/cliSelector.sh
source ./_files/helpers/menuContent.sh
source ./_files/helpers/actions.sh

source ./_files/pages/wrongSelection.sh
source ./_files/pages/inDevelopment.sh
source ./_files/pages/last.sh



ServerModule(){
   uiMenu \
   "$MI01_01" \
   "$MI01_02" \
   "$MI01_03" \
   "$MI01_04" \
   false \
   false \
   false \
   false \
   "$MT01"
   
   cliSelector \
   updateUpgradeServer \
   installInitialSoftServer \
   installDockerStack \
   inDevelopment \
   inDevelopment \
   inDevelopment \
   inDevelopment \
   inDevelopment \
   MainModule \
   wrongSelection \
   ServerModule
}