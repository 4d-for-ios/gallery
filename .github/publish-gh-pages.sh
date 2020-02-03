GITHUB_TOKEN=$1

remoteBranch="https://${GITHUB_ACTOR}:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"

DEPLOYMENT_BRANCH="gh-pages"

# Go to a specific folder to work
mdkir -p build
cd build
# clone gh-pages
git clone ${remoteBranch} ${PROJECT_NAME}-${DEPLOYMENT_BRANCH}
cd "${PROJECT_NAME}-${DEPLOYMENT_BRANCH}"
git checkout -b ${DEPLOYMENT_BRANCH}

# remove everything (file will be replaces)
#git rm -rf .

# return to website root
#cd ../..

# copy files

# return to clone
#cd 
#git commit -m "Deploy website version based on ${currentCommit}"

#git push origin ${DEPLOYMENT_BRANCH}

echo "Publish into https://${ORGANIZATION_NAME}.github.io/${PROJECT_NAME}"