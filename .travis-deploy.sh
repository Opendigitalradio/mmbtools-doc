#!/bin/bash
#
# This script is called by Travis-CI to deploy
# to github pages

set -e

# clear and re-create the out directory
rm -rf out || exit 0;
mkdir out

# copy all output files to the out directory
cp mmbtools.pdf out/

# go to the out directory and create a *new* Git repo
cd out
git init

git config user.name "Travis CI"
git config user.email "Travis-CI@opendigitalradio.org"
git add .
git commit -m "Deploy to GitHub Pages"

# Force push from the current repo's master branch to the remote
# repo's gh-pages branch. (All previous history on the gh-pages branch
# will be lost, since we are overwriting it.) We redirect any output to
# /dev/null to hide any sensitive credential data that might otherwise be exposed.
git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:gh-pages > /dev/null 2>&1
