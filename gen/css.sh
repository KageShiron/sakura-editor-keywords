#!/bin/sh

mkdir -p results/css/
wget https://cdn.rawgit.com/mdn/data/master/css/properties.json 
cat properties.json  | jq keys[] -r > results/css/css.kwd
curl https://cdn.rawgit.com/mdn/data/master/css/at-rules.json  | jq keys[] -r >> results/css/css.kwd
cat properties.json  | jq .[].syntax -r | sed -e "/<*>/d" | sed -e "/*(*)/d" |  tr -d " []" | tr "|" "\n" > temp
curl https://cdn.rawgit.com/mdn/data/master/css/syntaxes.json | jq .[].syntax -r | sed -e "/<*>/d" | sed -e "/*(*)/d" |  tr -d " []" | tr "|" "\n" | grep --line-regexp  -E "^[0-9a-zA-Z-]{3,}"  >> temp
cat temp | sort | uniq >> results/css/css.kwd
rm temp
rm properties.json
cp css.md results/css/readme.md