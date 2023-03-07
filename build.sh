#!/bin/bash

rm -rf dist
cp -R src dist
cd src
npx tailwindcss -i ./input.css -o ../dist/generated.css