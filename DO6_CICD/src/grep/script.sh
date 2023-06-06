count=1;

checkFile() {
    if [ -f "result.txt" ]
    then
        if [ -s "result.txt" ]
        then
        echo "Test $count FAIL!"
        exit 1
        else
        echo "Test $count OK"
        count=$(($count + 1))
        fi
    fi
}

./s21_grep -i -e into text.txt text2.txt text3.txt > t1.txt && grep -i -e into text.txt text2.txt text3.txt > t2.txt && diff t1.txt t2.txt > result.txt
checkFile
./s21_grep -v into text.txt text2.txt text3.txt > t1.txt && grep -v into text.txt text2.txt text3.txt > t2.txt && diff t1.txt t2.txt > result.txt
checkFile
./s21_grep -c into text.txt text2.txt text3.txt > t1.txt && grep -c into text.txt text2.txt text3.txt > t2.txt && diff t1.txt t2.txt > result.txt
checkFile
./s21_grep -l into text.txt text2.txt text3.txt > t1.txt && grep -l into text.txt text2.txt text3.txt > t2.txt && diff t1.txt t2.txt > result.txt
checkFile
./s21_grep -n into text.txt text2.txt text3.txt > t1.txt && grep -n into text.txt text2.txt text3.txt > t2.txt && diff t1.txt t2.txt > result.txt
checkFile
./s21_grep -h into text.txt text2.txt text3.txt > t1.txt && grep -h into text.txt text2.txt text3.txt > t2.txt && diff t1.txt t2.txt > result.txt
checkFile
./s21_grep -s into text.txt text2.txt text3.txt > t1.txt && grep -s into text.txt text2.txt text3.txt > t2.txt && diff t1.txt t2.txt > result.txt
checkFile
./s21_grep -f file.txt text.txt text2.txt text3.txt > t1.txt && grep -f file.txt text.txt text2.txt text3.txt > t2.txt && diff t1.txt t2.txt > result.txt
checkFile
./s21_grep -o into text2.txt text3.txt > t1.txt && grep -o into text2.txt text3.txt > t2.txt && diff t1.txt t2.txt > result.txt
checkFile
./s21_grep -iv into text.txt text2.txt text3.txt > t1.txt && grep -iv into text.txt text2.txt text3.txt > t2.txt && diff t1.txt t2.txt > result.txt
checkFile
./s21_grep -in into text.txt text2.txt text3.txt > t1.txt && grep -in into text.txt text2.txt text3.txt > t2.txt && diff t1.txt t2.txt > result.txt
checkFile
./s21_grep -ic into text.txt text2.txt text3.txt > t1.txt && grep -ic into text.txt text2.txt text3.txt > t2.txt && diff t1.txt t2.txt > result.txt
checkFile
./s21_grep -ih into text.txt text2.txt text3.txt > t1.txt && grep -ih into text.txt text2.txt text3.txt > t2.txt && diff t1.txt t2.txt > result.txt
checkFile
./s21_grep -is into text.txt text2.txt text3.txt > t1.txt && grep -is into text.txt text2.txt text3.txt > t2.txt && diff t1.txt t2.txt > result.txt
checkFile
./s21_grep -s -i -f file.txt text2.txt text3.txt > t1.txt && grep -s -i -f file.txt text2.txt text3.txt > t2.txt && diff t1.txt t2.txt > result.txt
checkFile
./s21_grep -o into text.txt text2.txt text3.txt > t1.txt && grep -o into text.txt text2.txt text3.txt > t2.txt && diff t1.txt t2.txt > result.txt
checkFile
./s21_grep -i -e into -e t -e i text.txt text2.txt text3.txt > t1.txt && grep -i -e into -e t -e i text.txt text2.txt text3.txt > t2.txt && diff t1.txt t2.txt > result.txt
checkFile
./s21_grep -ivl into text.txt text2.txt text3.txt > t1.txt && grep -ivl into text.txt text2.txt text3.txt > t2.txt && diff t1.txt t2.txt > result.txt
checkFile
./s21_grep -ivl into text.txt text2.txt text3.txt > t1.txt && grep -ivl into text.txt text2.txt text3.txt > t2.txt && diff t1.txt t2.txt > result.txt
checkFile
./s21_grep -ivl into text.txt text2.txt text3.txt > t1.txt && grep -ivl into text.txt text2.txt text3.txt > t2.txt && diff t1.txt t2.txt > result.txt
checkFile
./s21_grep -ivl into text.txt text2.txt text3.txt > t1.txt && grep -ivl into text.txt text2.txt text3.txt > t2.txt && diff t1.txt t2.txt > result.txt
checkFile
./s21_grep -ivl t text.txt text2.txt text3.txt > t1.txt && grep -ivl t text.txt text2.txt text3.txt > t2.txt && diff t1.txt t2.txt > result.txt
checkFile
./s21_grep -ivl t text.txt text2.txt text3.txt > t1.txt && grep -ivl t text.txt text2.txt text3.txt > t2.txt && diff t1.txt t2.txt > result.txt
checkFile
./s21_grep -ivl t text.txt text2.txt text3.txt > t1.txt && grep -ivl t text.txt text2.txt text3.txt > t2.txt && diff t1.txt t2.txt > result.txt
checkFile
./s21_grep -ivl "" text.txt > t1.txt && grep -ivl "" text.txt > t2.txt && diff t1.txt t2.txt > result.txt
checkFile