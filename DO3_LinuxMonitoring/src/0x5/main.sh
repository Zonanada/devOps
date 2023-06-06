#!/bin/bash
START=$(date +%s%N)
if [ ! -d $1 ]; then
    echo "error: no directory"
    exit 0
fi

if [[ $1 =~ /$ ]]; then
    ok=ok
    else
    echo "Аргумент пуст или нет знака '/' в конце пути"
    exit 0
fi

source ./help.sh

echo "Total number of folders (including all nested ones) = $((`find $1 -type d | wc -l` - 1))"
for ((i=1; i < ${#my_array_topDir[*]}; i++))
    do
    echo "$i - ${my_array_topDir[i]}, `du -sh ${my_array_topDir[i]} | awk '{print $1}'`"
    done
echo "Total number of files = `ls $1 -laR | grep "^-" | wc | awk '{print $1}'`"
echo "Number of:"
echo "Configuration files (with the .conf extension) = `find $1 -name '*.conf' | wc | awk '{print $1}'`"
echo "Text files = `grep -rI -l --exclude-dir="\.svn" "[a-Z]" $1 | wc -l`"
echo "Executable files = `find $1 -type f -executable -print | wc -l`"
echo "Log files (with the extension .log) = `find $1 -name '*.log' | wc | awk '{print $1}'`"
echo "Archive files = `find $1 -name '*.zip' | wc | awk '{print $1}'`"
echo "Symbolic links = `find $1 -type l | wc | awk '{print $1}'`"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
for ((i=1; i < ${#my_array_topFiles[*]}; i++))
    do
    echo "$i - ${my_array_topFiles[i]}, `du -sh ${my_array_topFiles[i]} | awk '{print $1}'`, ${my_array_topFiles[i]##*.}"
    done
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
for ((i=1; i < ${#my_array_topFilesPlay[*]}; i++))
    do
    echo "$i - ${my_array_topFilesPlay[i]}, `du -sh ${my_array_topFilesPlay[i]} | awk '{print $1}'`, `md5sum ${my_array_topFilesPlay[i]} | awk '{print $1}'`"
    done
END=$(date +%s%N)
DIFF=$(( $(( $END - $START )) /1000000 ))
if [ $DIFF -le "1000" ] ; then
    zero="0"
fi

echo "Script execution time (in seconds) = $zero$(bc<<<"scale=2;$DIFF / 1000")"
  