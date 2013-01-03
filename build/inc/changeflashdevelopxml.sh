if [[ $# != 1 ]]
then

echo "Improper number of arguments.
FORMAT bash changeflashdevelop.sh <FILE>

"
exit 0

fi

#!/bin/bash

xml_file=${1}
#new_path=${2}

#echo $xml_file
#echo $new_path

# Gets the parent path
cd ../
new_path=$PWD
cd ./build
#echo $new_path

touch newfile1.xml
# Removes the 'classes' from the object file into newfile
sed 's/\<path-element\>C\:\\Program Files (x86)\\FlashDevelop\\Library\\AS3\\classes\<\/path-element\>//g' $xml_file > newfile1.xml 
# Replaces the '\' to '/'
touch newfile2.xml
sed 's/\\/\//g' newfile1.xml > newfile2.xml
rm newfile1.xml

# Read the xml and get the classpath
touch classpath.file
# Extract the path node
xpath newfile2.xml "/flex-config/file-specs/path-element/text()" > classpath.file
# Remove the src and beyond
touch classpath2.file
sed 's/\/src.*//g' classpath.file > classpath2.file
rm classpath.file
touch classpath3.file
sed 's/\//\\\//g' classpath2.file > classpath3.file
rm classpath2.file

class_path=$(<./classpath3.file)
#new_path=newpath
rm classpath3.file

touch new_path_escaped.file
echo $new_path
echo $new_path | sed 's/\//\\\//g' > new_path_escaped.file
new_path_escaped=$(<./new_path_escaped.file)
rm new_path_escaped.file

# Now we have the string we need to replace, let's replace it with this path
touch flex_config.xml
sed -e s/"$class_path"/"$new_path_escaped"/g newfile2.xml > flex_config.xml
rm newfile2.xml
