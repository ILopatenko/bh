#!/bin/bash
# PAGE HELPER
source ./_files/helpers/uiMenu.sh


page(){
   params=("$@")
   clear -x
   echo
   printFrameMenuLine
   printEmptyMenuLine
   printEmptyMenuLine
   printEmptyMenuLine
   for ((i = 0 ; i < ${#params[@]} ; i++)); do
      if [[ ${params[$i]} == "false" ]]; then
         printEmptyMenuLine
      else
         printItemMenuLine "${params[$i]}"
      fi
   done
   printEmptyMenuLine
   printFrameMenuLine
   echo
}