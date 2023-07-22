#!/bin/bash
# WRONG SELECTION PAGE
source ./_files/helpers/page.sh



inDevelopment(){
   page \
   false \
   "$ID01" \
   false \
   "$ID02" \
   false \
   "$ID03" \
   false \
   false
   sleep 2
}
