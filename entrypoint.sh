#!/bin/sh

EMPTY_OVERRIDE="{}"
if [ -z $INPUT_OVERRIDE ]
then
  INPUT_OVERRIDE=$EMPTY_OVERRIDE
fi
if [ ! -z $INPUT_NO_CI_DATA ]
then
  ADDITIONAL_OVERRIDE=$EMPTY_OVERRIDE
else
  RUNNER_SERVICE=${GITHUB_ACTIONS:+"github"}
  RUNNER_NAME=$RUNNER_NAME
  RUNNER_OS=$RUNNER_OS
  RUNNER_ARCH=$RUNNER_ARCH
  TRIGGER=$GITHUB_EVENT_NAME
  JOB_ID=$GITHUB_JOB
  REF_NAME=$GITHUB_REF_NAME
  REF_TYPE=$GITHUB_REF_TYPE
  SHA=$GITHUB_SHA
  REPO=${GITHUB_REPOSITORY:+"github:$GITHUB_REPOSITORY"}
  RUN_ATTEMPT=$GITHUB_RUN_ATTEMPT
  RUN_ID=$GITHUB_RUN_ID

  ADDITIONAL_OVERRIDE="
  {
    \"runs\": {
      \"ci\": \"${CI:+"true"}\",
      \"runner_service\": \"$RUNNER_SERVICE\",
      \"runner_name\": \"$RUNNER_NAME\",
      \"runner_os\": \"$RUNNER_OS\",
      \"runner_arch\": \"$RUNNER_ARCH\",
      \"trigger\": \"$TRIGGER\",
      \"job_id\": \"$JOB_ID\",
      \"ref_name\": \"$REF_NAME\",
      \"ref_type\": \"$REF_TYPE\",
      \"sha\": \"$SHA\",
      \"repo\": \"$REPO\",
      \"run_id\": \"$RUN_ID\",
      \"run_attempt\": \"$RUN_ATTEMPT\"
    }
  }"
fi
if [ "$ADDITIONAL_OVERRIDE" != "$INPUT_OVERRIDE" ]; then
  COMBINED_OVERRIDE=$(jq -s '.[0] * .[1]' <(echo "$ADDITIONAL_OVERRIDE") <(echo "${INPUT_OVERRIDE:-$EMPTY_OVERRIDE}"))
fi

echo "Running yatt-pipe: node /yatt-pipe/node_modules/yatt-pipe/index.js \
 ${INPUT_SOURCE:+--source $INPUT_SOURCE} \
 ${INPUT_TARGET:+--target $INPUT_TARGET} \
 ${INPUT_CREDENTIALS:+--credentials $INPUT_CREDENTIALS} \
 ${INPUT_IGNORE:+--ignore $INPUT_IGNORE} \
 ${COMBINED_OVERRIDE:+--overrides \"$COMBINED_OVERRIDE\"} \
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
