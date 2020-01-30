#!/bin/bash
currentDir="."
input="$currentDir/.gallery-workflow.yml"

topics=$(yq -t r .gallery-workflow.yml "topics" | sed "s/- //")

status=0
for topic in $topics
do
  echo "🏷  $topic"
  jsonDir=$currentDir/Output/$topic
  
  files=$(find $jsonDir -name '*.json')
  for jsonFile in $files; do
    echo $jsonFile
    jq -S '.' "$jsonFile" > "$jsonFile"_sorted
    rm "$jsonFile"
    mv "$jsonFile"_sorted  "$jsonFile"
  done
  
done < "$input"

exit $status
