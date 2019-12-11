#!/bin/sh -l

set -e o pipefail

env_variables=$(env | awk '{print "-e " $1 " \\"}')

ecs deploy $CLUSTER_NAME $SERVICE_NAME --task $TASK_NAME $env_variables --exclusive-env