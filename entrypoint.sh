#!/bin/sh -l

set -e o pipefail

env_variables=$(jq -n 'env' | jq --arg CONTAINER "$INPUT_CONTAINER" -r 'keys[] as $k | "-e \($CONTAINER) \($k) \"\(values[$k])\""')

command=$(printf "ecs deploy $INPUT_CLUSTER $INPUT_SERVICE --task $INPUT_TASK $env_variables --exclusive-env")

eval $command