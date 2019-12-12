#!/bin/sh -l

set -e o pipefail

env_variables=$(jq -n 'env' | jq --arg CONTAINER "$CONTAINER_NAME" -r 'keys[] as $k | "-e \($CONTAINER) \($k) \"\(values[$k])\""')

command=$(printf "ecs deploy --task $TASK_NAME --exclusive-env $env_variables $CLUSTER_NAME $SERVICE_NAME")

eval $command