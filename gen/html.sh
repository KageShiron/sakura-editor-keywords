#!/bin/sh
mkdir -p results/html/
echo "// HTML" > results/html/html.kwd
date "+// %Y/%m/%d" >> results/html/html.kwd

curl https://cdn.jsdelivr.net/gh/WebKit/webkit@master/Source/WebCore/html/HTMLAttributeNames.in | tail -n +6 >> results/html/html.kwd
curl https://cdn.jsdelivr.net/gh/WebKit/webkit@master/Source/WebCore/html/HTMLTagNames.in | cut -f1 -d" " | tail -n +6 >> results/html/html.kwd
cp LICENSE-APPLE.txt results/html/LICENSE-APPLE
cp html.md results/html/readme.md
