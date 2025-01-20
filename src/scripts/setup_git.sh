#!/bin/bash
# This script is used to setup git and create a PR

# Setup git user
git config --local user.email "${GIT_USER_EMAIL}"
git config --local user.name "${GIT_USER_NAME}"

# Create a new branch
git checkout -b "${GIT_BRANCH_NAME}"

# Add, commit and push the changes
git add .
git commit -m "${GIT_COMMIT_MESSAGE}"
git push --set-upstream origin "${GIT_BRANCH_NAME}"

# Create a PR
# gh pr create --title "${GIT_PR_TITLE}" --body "${GIT_COMMIT_MESSAGE}" --base "${GIT_BASE_BRANCH}" --head "${GIT_BRANCH_NAME}"
gh pr create --title "${GIT_PR_TITLE}" --body "${GIT_COMMIT_MESSAGE}" --base "${GIT_BASE_BRANCH}" --head "${GIT_BRANCH_NAME}"
