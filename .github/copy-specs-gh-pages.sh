#!/bin/sh

GITHUB_REPOSITORY=$1
GITHUB_ACTOR=$2
REPOSITORY_NAME=$3
GITHUB_TOKEN=$4
GITHUB_SHA=$5

DEPLOYMENT_BRANCH="gh-pages"

# clone gh-pages
echo "⬇️ clone ${DEPLOYMENT_BRANCH}"
remoteBranch="https://${GITHUB_ACTOR}:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"
git clone -b "${DEPLOYMENT_BRANCH}" --single-branch "${remoteBranch}" "${REPOSITORY_NAME}-${DEPLOYMENT_BRANCH}"
pwd
cd "${REPOSITORY_NAME}-${DEPLOYMENT_BRANCH}"

# remove everything (file will be replaces)
echo "⚙️ remplace files by builded ones"
output="Specs" # todo: take from conf file
git rm -rf ./$output/
mkdir -p $output
source="../$output/"

#echo "copy index file by topics" # if we want to do it by file
#topics=$(yq r ../../.gallery-workflow.yml "topics" | sed "s/- //")
#for topic in $topics
#do
#  echo "🏷  $topic"
#  mkdir -p "$output/$topic"
#  cp "$source$topic/index.json" "$output/$topic/"
  
#  for repo in $source$topic/*
#  do 
#    echo "📦 $repo"
#    mkdir -p $output/$topic/$repo
 #   cp "$source$topic/$repo/info.json" "$output/$topic/$repo/"
    
#  done
#done

cp -R $source ./$output/

# return to clone
echo "🌊 commit for ${GITHUB_SHA}"
git add .
git commit -m "Deploy website version based on ${GITHUB_SHA}"

#git push origin ${DEPLOYMENT_BRANCH}
echo "⬆️ push to ${DEPLOYMENT_BRANCH}"
git push origin
