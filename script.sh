#!/bin/bash
echo "Ready to get busy?"
firstline=$(head -n1 source/changelog.md)
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo "You are building version" $version
echo "Do you continue working on this version? (1 for yes, 0 for no)"
read versioncontinue
if [ $versioncontinue -eq 1 ]

then
  echo "OK. Commencing copy..."
  sleep 3s

for filename in source/*
do
if [ $filename == "source/secretinfo.md" ]
  then
    echo "Not copying" $filename
  else
    echo "Copying" $filename
    cp $filename build/.
fi
done    
    sleep 5s
    echo "Copying complete. Printing files to terminal..."
    sleep 5s
    cd build/
    echo "Build version $version contains:"
    ls
    cd ..
else
  echo "Please come back when you are ready."
fi
