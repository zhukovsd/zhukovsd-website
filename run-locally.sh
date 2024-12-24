#!/bin/zsh

docker run -p 1313:1313 \
  -v ${PWD}:/src \
  hugomods/hugo:0.129.0 \
  hugo server --bind 0.0.0.0