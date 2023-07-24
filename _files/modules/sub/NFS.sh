#!/bin/bash
# NFS

source ./_files/helpers/uiMenu.sh
source ./_files/helpers/cliSelector.sh
source ./_files/helpers/menuContent.sh
source ./_files/helpers/actions.sh

source ./_files/pages/wrongSelection.sh
source ./_files/pages/inDevelopment.sh
source ./_files/pages/last.sh



NFS(){
   uiMenu \
   "$MI072_01" \
   "$MI072_02" \
   "$MI072_03" \
   "$MI072_04" \
   "$MI072_05" \
   "$MI072_06" \
   "$MI072_07" \
   "$MI072_08" \
   "$MT072"
   
   cliSelector \
   connectAll \
   connectAllRyzen \
   connectRyzenSHARE \
   connectRyzenMEDIA \
   connectRyzenIT \
   connectAllDell \
   connectDellMEDIA \
   connectDellIT \
   PersonalModule \
   wrongSelection \
   NFS
}