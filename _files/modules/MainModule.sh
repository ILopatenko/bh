#!/bin/bash
# MAIN MODULE

source ./_files/helpers/uiMenu.sh
source ./_files/helpers/cliSelector.sh
source ./_files/helpers/menuContent.sh

source ./_files/pages/wrongSelection.sh
source ./_files/pages/inDevelopment.sh
source ./_files/pages/last.sh



MainModule(){
   uiMenu \
   "$MI00_01" \
   "$MI00_02" \
   "$MI00_03" \
   "$MI00_04" \
   "$MI00_05" \
   false \
   "$MI00_07" \
   "$MI00_08" \
   "$MT00"
   
   cliSelector \
   inDevelopment \
   inDevelopment \
   inDevelopment \
   inDevelopment \
   inDevelopment \
   inDevelopment \
   inDevelopment \
   inDevelopment \
   last \
   wrongSelection \
   MainModule
}