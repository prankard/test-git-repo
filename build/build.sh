#!/bin/bash

######################
## CONFIG VARIABLES ##
######################



FLEX_HOME=/Users/james/Development/SDK/Flash/Flex4.6_AIR3.4


# Make the temp directory
if [ ! -d ./temp ]; then
	mkdir temp
fi

# Creates a new config file (flex_config.xml)
for PROJECT_FILE in ../*.as3proj; 
	do echo $PROJECT_FILE;
	source ./inc/getinfofromproject.sh $PROJECT_FILE;
done;

for CONFIG_FILE in ../obj/*.xml; 
	do echo $CONFIG_FILE;
	bash ./inc/changeflashdevelopxml.sh $CONFIG_FILE;
done;

$FLEX_HOME/bin/mxmlc -load-config+=flex_config.xml -o ../$path $additional

# Cleanup our config
rm flex_config.xml

# Copy everything from bin
cp -r ../bin/* temp