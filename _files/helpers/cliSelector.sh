#!/bin/bash

source ./_files/pages/wrongSelection.sh


cliSelector(){
   read -p "CHOOSE THE NEXT ACTION: " ans
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