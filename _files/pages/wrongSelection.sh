#!/bin/bash
# WRONG SELECTION PAGE
source ./_files/helpers/page.sh



wrongSelection(){
   page \
   false \
   "$1 $WS01" \
   false \
   "$WS02" \
   false \
   "$WS03" \
   false \
   false
   sleep 2
}
