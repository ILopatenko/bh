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
   false \
   false \
   false \
   false \
   false \
   false \
   "$MT00"
   
   cliSelector \
   "echo 'hello1'" \
   "echo 'hello2'" \
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