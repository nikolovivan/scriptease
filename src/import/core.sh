#!/bin/bash

# The MIT License (MIT)
# 
# Copyright (c) 2015 Ivan Nikolov
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.


# Contains core functions that are not in a specific category.

# Runs a command and fails the whole script if the command breaks.
# Use only for critical commands!
#
function run_command() {
    eval "$@"
    rc=$?
    if [ "$rc" != 0 ]; then
        echo "ERROR: $@ failed with $rc"
        exit $rc
    fi
}

# Reads a value from a config file.
# Params:
#     CONFIG: The path to the config file.
#     VAL: The value to get.
#     SEP: The separator of the values.
#
function readConfigVal() {
    local CONFIG=$1
    local VAL=$2
    local SEP=${3:-"="}
    echo $(awk -F''$SEP'' '{ if ($1 ~ /^'$VAL'$/) print $2}' $CONFIG)
}

# Implements a sleep functionality.
# Params:
#     MINUTES: The amount in minutes to sleep.
#
function sleepInMinutes() {
    local MINUTES=$1
    sleep "$MINUTES"m
}

# Generates a UUID.
#
function generateUUID() {
    echo $(uuidgen)
}

# Gets a line and separates it by the given separator and writes
# each item of the original line on its own line together with the item index.
# Thanks to Gianandrea Minneci!
# Params:
#    FILE: The file to get the line from.
#    NLINE: The line number to parse. Default: -1
#    SEP: The separator of the items of the line. Default '\t'
#
function line() {
    local FILE=$1
    local NLINE=${2:-1}
    local SEP=${3:-"\t"}

    head -$NLINE $FILE | tail -1 | awk -F$SEP '{for (i = 1; i <= NF; i++) print i,$i}'
}