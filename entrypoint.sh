#!/bin/sh -l

set -e o pipefail

env_variables=$(jq -n 'env' | jq --arg CONTAINER "$CONTAINER_NAME" -r 'keys[] as $k | "-e \($CONTAINER) \($k) \"\(values[$k])\""')

eval "ecs deploy $CLUSTER_NAME $SERVICE_NAME --task $TASK_NAME $env_variables --exclusive-env"