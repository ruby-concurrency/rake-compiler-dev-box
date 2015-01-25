#!/usr/bin/env bash

ORIGINAL_PATH=$PATH
TEST_RUNNER="./concurrent-ruby/build-tests/runner.rb"

PATH="/c/Ruby193/bin:$ORIGINAL_PATH"
$TEST_RUNNER

PATH="/c/Ruby200/bin:$ORIGINAL_PATH"
$TEST_RUNNER

PATH="/c/Ruby21/bin:$ORIGINAL_PATH"
$TEST_RUNNER

PATH="/c/Ruby200-x64/bin:$ORIGINAL_PATH"
$TEST_RUNNER

PATH="/c/Ruby21-x64/bin:$ORIGINAL_PATH"
$TEST_RUNNER
