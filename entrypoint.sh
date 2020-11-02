#!/bin/sh -le

result=$(ecs $INPUT_ARGS)

echo "::set-output name=result::$result"