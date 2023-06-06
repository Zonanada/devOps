# ./s21_cat -b testV.txt text.txt text2.txt text3.txt > t1.txt && cat testV.txt text.txt text2.txt text3.txt > t2.txt && diff -e -e t1.txt t2.txt
# ./s21_cat -e text.txt text2.txt > t1.txt && cat -e text.txt text2.txt > t2.txt && diff -e -e t1.txt t2.txt
# ./s21_cat -n testV.txt text.txt text2.txt > t1.txt && cat -n testV.txt text.txt text2.txt > t2.txt && diff -e -e t1.txt t2.txt
# ./s21_cat -s testV.txt text.txt text2.txt > t1.txt && cat -s testV.txt text.txt text2.txt > t2.txt && diff -e -e t1.txt t2.txt


# ./s21_cat -b testV.txt text.txt text2.txt text3.txt >> t1.txt && cat testV.txt text.txt text2.txt text3.txt >> t2.txt 
# ./s21_cat -e text.txt text2.txt >> t1.txt && cat -e text.txt text2.txt >> t2.txt
# ./s21_cat -n testV.txt text.txt text2.txt >> t1.txt && cat -n testV.txt text.txt text2.txt >> t2.txt
# ./s21_cat -s testV.txt text.txt text2.txt >> t1.txt && cat -s testV.txt text.txt text2.txt >> t2.txt
# ./s21_cat -t text.txt text2.txt text3.txt >> t1.txt && cat -t text.txt text2.txt text3.txt >> t2.txt
# ./s21_cat -eb text.txt text2.txt text3.txt >> t1.txt && cat -eb text.txt text2.txt text3.txt >> t2.txt 
# ./s21_cat -en text.txt text2.txt text3.txt >> t1.txt && cat -en text.txt text2.txt text3.txt >> t2.txt
# ./s21_cat -es text.txt text2.txt text3.txt >> t1.txt && cat -es text.txt text2.txt text3.txt >> t2.txt
# ./s21_cat -et text.txt text2.txt text3.txt >> t1.txt && cat -et text.txt text2.txt text3.txt >> t2.txt
# ./s21_cat -benst text.txt text2.txt text3.txt >> t1.txt && cat -benst text.txt text2.txt text3.txt >> t2.txt
# ./s21_cat -bens text.txt text2.txt text3.txt >> t1.txt && cat -bens text.txt text2.txt text3.txt >> t2.txt
# ./s21_cat -ben text.txt text2.txt text3.txt >> t1.txt && cat -be text.txt text2.txt text3.txt >> t2.txt
# diff -e t1.txt t2.txt

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



    ./s21_cat testV.txt text.txt text2.txt text3.txt > t1.txt && cat testV.txt text.txt text2.txt text3.txt > t2.txt && diff t1.txt t2.txt > result.txt
	checkFile
    ./s21_cat -e text.txt text2.txt > t1.txt && cat -e text.txt text2.txt > t2.txt && diff t1.txt t2.txt > result.txt
    checkFile
	./s21_cat  testV.txt text.txt text2.txt > t1.txt && cat  testV.txt text.txt text2.txt > t2.txt && diff   t1.txt t2.txt > result.txt
    checkFile
	./s21_cat -s testV.txt text.txt text2.txt > t1.txt && cat -s testV.txt text.txt text2.txt > t2.txt && diff  t1.txt t2.txt > result.txt
    checkFile
	./s21_cat -t text.txt text2.txt text3.txt > t1.txt && cat -t text.txt text2.txt text3.txt > t2.txt && diff  t1.txt t2.txt > result.txt
    checkFile
	./s21_cat -e text.txt text2.txt text3.txt > t1.txt && cat -e text.txt text2.txt text3.txt > t2.txt && diff  t1.txt t2.txt > result.txt
    checkFile
	./s21_cat -e text.txt text2.txt text3.txt > t1.txt && cat -e text.txt text2.txt text3.txt > t2.txt && diff  t1.txt t2.txt > result.txt
    checkFile
	./s21_cat -s text.txt text2.txt text3.txt > t1.txt && cat -s text.txt text2.txt text3.txt > t2.txt && diff  t1.txt t2.txt > result.txt
    checkFile
	./s21_cat -et text.txt text2.txt text3.txt > t1.txt && cat -et text.txt text2.txt text3.txt > t2.txt && diff  t1.txt t2.txt > result.txt
    checkFile
	./s21_cat -est text.txt text2.txt text3.txt > t1.txt && cat -est text.txt text2.txt text3.txt > t2.txt && diff  t1.txt t2.txt > result.txt
    checkFile
	./s21_cat -es text.txt text2.txt text3.txt > t1.txt && cat -es text.txt text2.txt text3.txt > t2.txt && diff  t1.txt t2.txt > result.txt
    checkFile
	./s21_cat -e text.txt text2.txt text3.txt > t1.txt && cat -e text.txt text2.txt text3.txt > t2.txt && diff  t1.txt t2.txt > result.txt
    checkFile