#!/bin/bash
currentDir="."
input="$currentDir/.gallery-workflow.yml"

topics=$(yq e '.topics' .gallery-workflow.yml | sed "s/- //")
output="Specs" # todo: take from conf file
status=0
for topic in $topics
do
  echo "🏷  $topic"
  jsonDir=$currentDir/$output/$topic
  
  files=$(find $jsonDir -name '*.json')
  for jsonFile in $files; do
    echo $jsonFile
    jq -S '.' "$jsonFile" > "$jsonFile"_sorted
    rm "$jsonFile"
    mv "$jsonFile"_sorted  "$jsonFile"
  done
  
done < "$input"

exit $status
