# Check if we have the file argument
if [[ $# != 1 ]]
then

echo "Improper number of arguments.
FORMAT bash getinforfromproject.sh <FILE>
"
exit 0

fi

PROJECT_FILE=${1}
# import the path variable
xpath $PROJECT_FILE "/project/output/movie/@path" > path.txt
#xpath $PROJECT_FILE "/project/output/movie/@path" > $myvar1

sed 's/\\/\//g' path.txt > tempfile; mv tempfile path.txt

source path.txt
echo $path
echo $myvar1

# remove the textfile
rm path.txt

touch compile_args.txt
xpath $PROJECT_FILE "/project/build/option/@additional" > compile_args.txt

source compile_args.txt
echo $additional
rm compile_args.txt