#!/bin/bash
# MAIN MODULE

source ./_files/helpers/uiMenu.sh
source ./_files/helpers/cliSelector.sh
source ./_files/helpers/menuContent.sh

source ./_files/pages/wrongSelection.sh
source ./_files/pages/inDevelopment.sh
source ./_files/pages/last.sh

source ./_files/modules/ServerModule.sh
source ./_files/modules/DesktopModule.sh
source ./_files/modules/PersonalModule.sh
source ./_files/modules/OracleModule.sh
source ./_files/modules/BigSoftModule.sh


MainModule(){
   uiMenu \
   "$MI00_01" \
   "$MI00_02" \
   "$MI00_03" \
   "$MI00_04" \
   false \
   false \
   "$MI00_07" \
   false \
   "$MT00"
   
   cliSelector \
   ServerModule \
   DesktopModule \
   OracleModule \
   BigSoftModule \
   inDevelopment \
   inDevelopment \
   PersonalModule \
   inDevelopment \
   last \
   wrongSelection \
   MainModule
}