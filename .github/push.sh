BRANCH=$1
GITHUB_TOKEN=$2

echo "Push to branch $BRANCH"

remote_repo="https://${GITHUB_ACTOR}:${GITHUB_TOKEN}@github.com/${GITHUB_REPOSITORY}.git"

git push "${remote_repo}" HEAD:${BRANCH}
