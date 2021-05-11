#!/bin/sh
# change the branch names appropriately
set -x
set -u
set -e

BRANCH=public-pages

# Cleanup
git worktree remove -f _site || true
rm -rf _site/ || true

# Link to branch
git worktree add -B $BRANCH _site origin/$BRANCH || true

# Build
hugo

# Commit new changes
cd public
git add --all
git commit -m "`date`"
git push origin $BRANCH:$BRANCH
cd ..
