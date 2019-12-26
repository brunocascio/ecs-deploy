#!/bin/sh -l

set -e o pipefail

# Validate input
[ -z "$INPUT_CLUSTER" ] && (echo "Missing Cluster Name" && exit 1)
[ -z "$INPUT_CONTAINER" ] && (echo "Missing Container Name" && exit 1)
[ -z "$INPUT_TASK" ] && (echo "Missing Task Name" && exit 1)
[ -z "$INPUT_SERVICE" ] && (echo "Missing Service Name" && exit 1)

if [ -z "$INPUT_ENVFILE" ]; 
then
    # parse system env variables
    echo "Env variables are read from 'env' command"
    env_variables=$(jq -n 'env' | jq --arg CONTAINER "$INPUT_CONTAINER" -r 'keys[] as $k | "-e \($CONTAINER) \($k) \"\(values[$k])\""')
else
    # parse file env variables
    [ ! -f $INPUT_ENVFILE ] && echo "File $INPUT_ENVFILE not found" && exit 1
    env_variables=$(cat "$INPUT_ENVFILE" | awk -F= -v CONTAINER="$INPUT_CONTAINER" '{print "-e " CONTAINER " " $1 " " "\"" $2 "\""}')
fi

# make string command to be evaluated (one line string)
command=$(printf "ecs deploy $INPUT_CLUSTER $INPUT_SERVICE --task $INPUT_TASK $env_variables --exclusive-env")

# fire command
eval $command