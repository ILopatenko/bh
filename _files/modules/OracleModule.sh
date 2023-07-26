#!/bin/bash
# ORACLE MODULE

source ./_files/helpers/uiMenu.sh
source ./_files/helpers/cliSelector.sh
source ./_files/helpers/menuContent.sh
source ./_files/helpers/actions.sh

source ./_files/pages/wrongSelection.sh
source ./_files/pages/inDevelopment.sh
source ./_files/pages/last.sh




OracleModule(){
   uiMenu \
   "$MI03_01" \
   "$MI03_02" \
   "$MI03_03" \
   "$MI03_04" \
   "$MI03_05" \
   "$MI03_06" \
   "$MI03_07" \
   false \
   "$MT03"
   
   cliSelector \
   firstConnectionNetmaker \
   firstConnectionNginx \
   connectToExistingNetmaker \
   connectToExistingNginx \
   installDockerStack \
   installNetmakerServer \
   installNetmakerClient \
   inDevelopment \
   MainModule \
   wrongSelection \
   OracleModule
}