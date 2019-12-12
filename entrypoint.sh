#!/bin/sh -l

set -e o pipefail

echo $INPUT_CONTAINER
echo $INPUT_CLUSTER
echo $INPUT_TASK
echo $INPUT_SERVICE

env_variables=$(jq -n 'env' | jq --arg CONTAINER "$INPUT_CONTAINER" -r 'keys[] as $k | "-e \($CONTAINER) \($k) \"\(values[$k])\""')

command=$(printf "ecs deploy $INPUT_CLUSTER $INPUT_SERVICE --task $INPUT_TASK $env_variables --exclusive-env")

echo $command

eval $command