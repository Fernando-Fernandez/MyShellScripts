if [ -z "$2" ]
then
    echo "USAGE:  splitCSVfiles <CSV filename> <number of lines>"
    echo "RESULT:  filename_1.csv filename_2.csv ..."
    exit
fi
rm -f -- header.csv
echo $( head -1 $1 ) > header.csv
split -l $2 $1 a1b2c3
n=0
for f in a1b2c3* ; do n=$(($n + 1)); cat header.csv $f >> ${1/.csv/_}$n.csv ; rm $f ; done
rm -f -- header.csv
