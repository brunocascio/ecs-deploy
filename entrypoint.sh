#!/bin/sh -le

result=$(ecs $INPUT_ARGS)
ret_code=$?

echo result=$result >> $GITHUB_OUTPUT

return $ret_code
