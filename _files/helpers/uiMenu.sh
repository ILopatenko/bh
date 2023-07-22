#!/bin/bash
# UI MENU HELPER
source ./_files/helpers/css.sh


#LENGTH (WIDTH) OF INNER MENU (SHOUD BE ODD)
menuWidth=49
frameSymbol="R"

framePart="$menuFrame $frameSymbol $dropStyles"

leftFramePart="   $framePart"
rightFramePart="$framePart"

generateStringLengthFirstNext(){
   frameMenuString=""
   for ((i = 0 ; i < $1 ; i++)); do
      if [[ $(($i%2)) -eq 0 ]]; then
         frameMenuString+="$2"
      else
         frameMenuString+="$3"
      fi
   done
   echo "$frameMenuString"
}


addGivenStyle(){
   echo "$1$2$dropStyles"
}

generatedFrameString=$(generateStringLengthFirstNext $menuWidth $frameSymbol " ")
generatedEmptyMenuString=$(generateStringLengthFirstNext $menuWidth " " " ")
frameStringStyled=$(addGivenStyle $menuFrame "$generatedFrameString")
emptyMenuStringStyled=$(addGivenStyle $menuBackground "$generatedEmptyMenuString")


prepareMenuContent(){
   menuContent="$1"
   menuContentLength=${#menuContent}
   if [[ $menuContentLength -gt $(($menuWidth-4)) ]]; then
      menuContent=${menuContent:0:$(($menuWidth-4))}
      echo "$menuBackground  $2$menuContent$dropStyles$menuBackground  "
   elif [[ $menuContentLength -eq $(($menuWidth-4)) ]]; then
      echo "$menuBackground  $2$menuContent$dropStyles$menuBackground  "
   else
      leftSpaces=$(generateStringLengthFirstNext $(( ($menuWidth-$menuContentLength) / 2)) " " " ")
      rightSpaces=$(generateStringLengthFirstNext $(( $menuWidth - ${#leftSpaces} -  $menuContentLength)) " " " ")
      echo "$menuBackground$leftSpaces$2$menuContent$dropStyles$menuBackground$rightSpaces"
   fi
}



printMenuLine(){
   echo -e "$leftFramePart$1$rightFramePart"
}

printFrameMenuLine(){
   printMenuLine "$frameStringStyled"
}

printEmptyMenuLine(){
   printMenuLine "$emptyMenuStringStyled"
}

printTitleMenuLine(){
   printMenuLine "$(prepareMenuContent "$1" $menuTitle)"
}

printItemMenuLine(){
   printMenuLine "$(prepareMenuContent "$1" $menuItem)"
}

printInDevelopmentMenuLine(){
   printMenuLine "$(prepareMenuContent "$1" $inDevelopment)"
}


#Takes in 9 parameters: first 8 - minu items and the last one - menu title
uiMenu(){
   params=("$@")
   clear -x
   echo
   printFrameMenuLine
   printEmptyMenuLine
   printTitleMenuLine "${params[8]}"
   printEmptyMenuLine
   for ((i = 1 ; i < ${#params[@]} ; i++)); do
      if [[ ${params[$i-1]} == "false" ]]; then
         printInDevelopmentMenuLine "$i. THIS FEATURE IS IN DEVELOPMENT"
      else
         printItemMenuLine "$i. ${params[$i-1]}"
      fi
   done
   printEmptyMenuLine
   printFrameMenuLine
   echo
}




