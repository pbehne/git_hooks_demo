# git_hooks_demo

This repository provides some very basic examples of pre-commit hooks. They are adapted from [here](https://sigmoidal.io/automatic-code-quality-checks-with-git-hooks/) and [here](https://danilodellaquila.com/en/blog/use-git-stash-in-your-pre-commit-hook).

The branches are as follows:

* bash - tests/run-tests is written in bash
* python - tests/run-tests is written in python
* bash_with_stash - same as bash, but uses stashing to prevent unstaged files from influencing test results
* bash_with_stash - same as python, but uses stashing to prevent unstaged files from influencing test results

The following files need to be made executable:
* tests/run-tests
* tests/pre-commit.sh
* tests/install_hooks.sh

To install hooks, run `tests/install_hooks.sh`. This only needs to be done once, regardless of the branch.
