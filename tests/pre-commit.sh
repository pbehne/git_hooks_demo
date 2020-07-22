#!/usr/bin/env bash

echo "Running pre-commit hook"

# Define a cleanup function                                                     
function cleanup()                                                              
{                                                                               
        echo "Skipping remaining tests"                                         
        test_result=1  # Make test fail                                         
}                                                                               
                                                                                
# Define a test function                                                        
function run_tests()                                                            
{                                                                               
        ./tests/run-tests                                
        test_result=$?  # Exit code from tests                                  
} 

# Stash unstaged changes so they don't affect the tests
git stash push -q --keep-index

# In case of ctrl+c during testing, run cleanup function
trap cleanup SIGINT
# Run pre-commit tests
run_tests

# Reapply stashed changes
git stash pop -q

# $? stores exit value of the last command
if [[ $test_result -ne 0 ]]; then
 echo "Tests must pass before commit!"
 exit 1
fi
