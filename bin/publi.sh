#!/bin/sh
# change the branch names appropriately
set -x
set -u
set -e

SITE_DIR=public
SITE_BRANCH=public-pages

# Cleanup
git worktree remove -f $SITE_DIR || true
rm -rf "$SITE_DIR" || true

# Link to branch
git worktree add -B "$SITE_BRANCH" $SITE_DIR "origin/$SITE_BRANCH" || true

# Build
hugo -b /maryame-bennani-site-static/

# Commit new changes
cd "$SITE_DIR"
git add --all
git commit -m "$(date)"
git push origin $SITE_BRANCH:$SITE_BRANCH
cd ..
