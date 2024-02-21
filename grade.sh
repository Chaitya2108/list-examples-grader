CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'
CPATH2='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar:grading-area'


rm -rf student-submission
rm -rf grading-area
rm -rf output.txt

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'

if [[ -f student-submission/ListExamples.java ]]
then
    echo "Correct file submitted."
else
    echo "File not found."
    exit 1
fi

cp -r student-submission/ListExamples.java grading-area
cp -r TestListExamples.java grading-area

if [[ -f grading-area/ListExamples.java ]]
then 
    echo "file moved successfully"
else
    echo "File not moved"
    exit 1
fi

javac -cp $CPATH grading-area/*.java

if [[ $? -eq 0 ]]
then
    echo "Files compiled successfully."
    
else
    echo "files did not compile"
    exit 1
fi

# java -cp $CPATH org.junit.runner.JUnitCore grading-area/TestListExamples
set +e
java -cp $CPATH2 org.junit.runner.JUnitCore TestListExamples > grading-area/output.txt
tail -n 2 grading-area/output.txt


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
