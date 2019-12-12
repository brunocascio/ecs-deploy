#!/bin/sh -l

set -e o pipefail

# Validate input
[ -z "$INPUT_CLUSTER" ] && (echo "Missing Cluster Name" && exit 1)
[ -z "$INPUT_CONTAINER" ] && (echo "Missing Container Name" && exit 1)
[ -z "$INPUT_TASK" ] && (echo "Missing Task Name" && exit 1)
[ -z "$INPUT_SERVICE" ] && (echo "Missing Service Name" && exit 1)

# parse env variables
env_variables=$(jq -n 'env' | jq --arg CONTAINER "$INPUT_CONTAINER" -r 'keys[] as $k | "-e \($CONTAINER) \($k) \"\(values[$k])\""')

# make string command to be evaluated (one line string)
command=$(printf "ecs deploy $INPUT_CLUSTER $INPUT_SERVICE --task $INPUT_TASK $env_variables --exclusive-env")

# fire command
eval $command