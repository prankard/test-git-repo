#!/bin/bash
# Uncomment this line to run locally
#FLEX_HOME=/Users/james/Development/SDK/Flash/Flex4.6_AIR3.4

#######
### Makes the TEMP folder

if [ ! -d ./temp ]; then
	mkdir temp
fi

#######
### Compiles SWF

cd ./inc
bash CompileSWF.sh
cd ..

#######
### COPY THE BIN FOLDER

cp -r ../bin/* temp



######
### COMPILE IPA

# Uncomment the select option you need
#export SELECT_OPTION='apk'
#export SELECT_OPTION='apk-debug'
#export SELECT_OPTION='apk-captive-runtime'
export SELECT_OPTION='ipa-test-interpreter'
#export SELECT_OPTION='ipa-debug-interpreter'
#export SELECT_OPTION='ipa-test'
#export SELECT_OPTION='ipa-debug'
#export SELECT_OPTION='ipa-ad-hoc'
#export SELECT_OPTION='ipa-app-store'

cd ./inc
bash PackageApp.sh
cd ..
