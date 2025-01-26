#!/bin/bash

sed -i "s/{{ AppVersion }}/$(cat latest-app-version.txt)/g" ./src/index.html

rm -rf dist
cp -R src dist
cd src
npm i tailwindcss
npx @tailwindcss/cli -i ./input.css -o ../dist/generated.css --minify
rm -rf node_modules ./package*.json ../dist/package*.json ../dist/input.css