#!/bin/sh

echo" Running yatt-pipe: /yatt-pipe/node_modules/yatt-pipe/index.js \
 ${INPUT_SOURCE:+--source $INPUT_SOURCE} \
 ${INPUT_TARGET:+--target $INPUT_TARGET} \
 ${INPUT_CREDENTIALS:+--credentials $INPUT_CREDENTIALS} \
 ${INPUT_IGNORE:+--ignore $INPUT_IGNORE} \
 ${INPUT_OVERRIDE:+--overrides $INPUT_OVERRIDE} \
 ${INPUT_DATA_TYPES:+--data-types $INPUT_DATA_TYPES} \
 ${INPUT_NO_GIT:+--no-git} \
 ${INPUT_VERBOSE:+--verbose}"

node /yatt-pipe/node_modules/yatt-pipe/index.js \
 ${INPUT_SOURCE:+--source $INPUT_SOURCE} \
 ${INPUT_TARGET:+--target $INPUT_TARGET} \
 ${INPUT_CREDENTIALS:+--credentials $INPUT_CREDENTIALS} \
 ${INPUT_IGNORE:+--ignore $INPUT_IGNORE} \
 ${INPUT_OVERRIDE:+--overrides $INPUT_OVERRIDE} \
 ${INPUT_DATA_TYPES:+--data-types $INPUT_DATA_TYPES} \
 ${INPUT_NO_GIT:+--no-git} \
 ${INPUT_VERBOSE:+--verbose}
