#i/bin/bash
$FOLDER=""
#if output doesnt exist, create it, if it exists then remove all the files 
if [ -d "output/" ]; then
    rm output/*
      # Control will enter here if $DIRECTORY exists.
  else
      mkdir output
  fi
for LINE in `diff -r compare1/ compare2/ | grep st-.*\.jpg$`
do
    if [[ $LINE == *"/:" ]]
    then
        #folder is line without the last character as its a ':'
        FOLDER="${LINE%?}"
    fi

    if [[ "$LINE" == *"st-"* ]]
    then  
        #concat folder and line
        OUTPUTFILE=$FOLDER$LINE
        cp $outputfile output/$LINE
        echo $outputfile

    fi
done

