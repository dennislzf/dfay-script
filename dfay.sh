#i/bin/bash
#if output doesnt exist, create it, if it exists then remove all the files
if [ -d "output/" ]; then
    rm -r output/
    mkdir output
  else
      mkdir output
  fi
for LINE in `diff -r data1/ data2/ | grep st.*\.jpg`
    do
    if [[ $LINE =~ .*: ]]
    then
        #folder is line without the last character as its a ':'
        FOLDER="${LINE%?}"
    fi
    if [[ $LINE =~ .*"st".*\.jpg ]];
    then
      #concat folder and line
      OUTPUTFILE=$FOLDER$LINE;
      NEWOUTPUTFILE=${OUTPUTFILE/.jpg/-${FOLDER%?}.jpg}
      cp $OUTPUTFILE $NEWOUTPUTFILE
      mv $NEWOUTPUTFILE output/;
    fi
done
echo "Diffs have been copied to output/"
