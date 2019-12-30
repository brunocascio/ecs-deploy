#!/bin/sh -l

set -e o pipefail

# Validate input
[ -z "$INPUT_CLUSTER" ] && (echo "Missing Cluster Name" && exit 1)
[ -z "$INPUT_CONTAINER" ] && (echo "Missing Container Name" && exit 1)
[ -z "$INPUT_TASK" ] && (echo "Missing Task Name" && exit 1)
[ -z "$INPUT_SERVICE" ] && (echo "Missing Service Name" && exit 1)

TIMEOUT=${INPUT_TIMEOUT:-300}

if [ ! -z "$INPUT_ENVFILE" ];
then
    [ ! -f $INPUT_ENVFILE ] && echo "$INPUT_ENVFILE not found" && exit 1 
    env_variables=$(grep -v '^#' "$INPUT_ENVFILE" | grep . | sed -E 's/=/ /1' | awk -v CONTAINER="$INPUT_CONTAINER" '{print "-e " CONTAINER " " $1 " " $2}')
    # make string command to be evaluated (one line string)
    command=$(printf "ecs deploy $INPUT_CLUSTER $INPUT_SERVICE --timeout $TIMEOUT --task $INPUT_TASK $env_variables --exclusive-env")
else
    command=$(printf "ecs deploy $INPUT_CLUSTER $INPUT_SERVICE --timeout $TIMEOUT --task $INPUT_TASK")
fi

# fire command
eval $command