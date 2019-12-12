#!/bin/sh -l

set -e o pipefail

env_variables=$(printenv | awk -v NAME=$CONTAINER_NAME '{print "-e " NAME " " $1 " "}' | xargs)

ecs deploy $CLUSTER_NAME $SERVICE_NAME --task $TASK_NAME -e $env_variables --exclusive-env