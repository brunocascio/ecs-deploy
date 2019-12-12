#!/bin/sh -l

set -e o pipefail

env_variables=$(jq -n 'env' | jq --arg CONTAINER "$INPUT_CONTAINER_NAME" -r 'keys[] as $k | "-e \($CONTAINER) \($k) \"\(values[$k])\""')

command=$(printf "ecs deploy $INPUT_CLUSTER_NAME $INPUT_SERVICE_NAME --task $INPUT_TASK_NAME $env_variables --exclusive-env")

echo $command

eval $command