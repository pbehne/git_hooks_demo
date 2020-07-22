#!/usr/bin/env bash

echo "Running pre-commit hook"
./tests/run-tests
test_result=$?  # Exit code from last command

# $? stores exit value of the last command
if [ $test_result -ne 0 ]; then
 echo "Tests must pass before commit!"
 exit 1
fi
