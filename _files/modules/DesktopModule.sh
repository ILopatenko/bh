#!/bin/bash
# MAIN MODULE

source ./_files/helpers/uiMenu.sh
source ./_files/helpers/cliSelector.sh
source ./_files/helpers/menuContent.sh
source ./_files/helpers/actions.sh

source ./_files/pages/wrongSelection.sh
source ./_files/pages/inDevelopment.sh
source ./_files/pages/last.sh



DesktopModule(){
   uiMenu \
   "$MI02_01" \
   "$MI02_02" \
   "$MI02_03" \
   "$MI02_04" \
   "$MI02_05" \
   false \
   false \
   false \
   "$MT02"
   
   cliSelector \
   updateUpgradeServer \
   installInitialSoftDesktop \
   installDockerStack \
   installNetmakerClient \
   installBigSoft \
   inDevelopment \
   inDevelopment \
   inDevelopment \
   MainModule \
   wrongSelection \
   DesktopModule
}