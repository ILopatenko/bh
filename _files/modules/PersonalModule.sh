#!/bin/bash
# PERSONAL MODULE

source ./_files/helpers/uiMenu.sh
source ./_files/helpers/cliSelector.sh
source ./_files/helpers/menuContent.sh
source ./_files/helpers/actions.sh

source ./_files/pages/wrongSelection.sh
source ./_files/pages/inDevelopment.sh
source ./_files/pages/last.sh



PersonalModule(){
   uiMenu \
   "$MI07_01" \
   "$MI07_02" \
   false \
   false \
   false \
   false \
   false \
   false \
   "$MT07"
   
   cliSelector \
   updateUpgradeServer \
   inDevelopment \
   inDevelopment \
   inDevelopment \
   inDevelopment \
   inDevelopment \
   inDevelopment \
   inDevelopment \
   MainModule \
   wrongSelection \
   PersonalModule
}