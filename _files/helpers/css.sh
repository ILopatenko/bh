#!/bin/bash
# CSS HELPER
source ./_files/helpers/colors.sh

dropStyles=$dropAllEffects

menuBackground=$cyanBGD

#MENU FRAME
menuFrameBackground=$magentaBGD
menuFrameText=$magentaBGD$redTCD$boldTE
menuFrame=$menuFrameBackground$menuFrameText


menuTitle=$boldTE$yellowTCD
menuItem=$boldTE$grayTCDalmostWhite
inDevelopment=$boldTE$blackTCD

mainCLIQuestionStyle=$boldTE$greenTCD$blackBGD

startActionStyle=$boldTE$italicTE$underlinedTE$blueBGD$grayTCDalmostWhite
finishActionStyle=$boldTE$italicTE$underlinedTE$blueBGD$greenTCD

hint=$boldTE$yellowBGD$redTCD