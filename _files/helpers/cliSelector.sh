#!/bin/bash
source ./_files/helpers/menuContent.sh
source ./_files/helpers/css.sh



cliSelector(){
  echo -e "$mainCLIQuestionStyle"
  read -p "$MQCLI" ans
  echo -e "$dropStyles"
      case $ans in
        1) $1;${11};;
        2) $2;${11};;
        3) $3;${11};;
        4) $4;${11};;
        5) $5;${11};;
        6) $6;${11};;
        7) $7;${11};;
        8) $8;${11};;
        q) $9;;
        *) ${10} "$ans";${11};;
      esac
}