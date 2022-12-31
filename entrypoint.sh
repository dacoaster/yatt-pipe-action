#!/bin/sh

printf '%d args:' "$#"
printf " '%s'" "$@"
printf '\n'
env

node /yatt-pipe/node_modules/yatt-pipe/index.js
