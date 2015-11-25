#!/bin/bash

set -o errexit -o nounset

rev=$(git rev-parse --short HEAD)

cd _book

mv ../book.pdf .

git init

git config user.name "IsmailM"
git config user.email "ismail.moghul@gmail.com"
git remote add deploy "https://$GH_TOKEN@github.com/sbcs-informatics/sbcs-informatics.github.io.git"

git fetch deploy master
git reset deploy/master

git add -A .
git commit -m "build website at ${rev}"
git push deploy HEAD:master
