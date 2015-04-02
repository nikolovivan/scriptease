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

# Contains functions related to paths and strings.

# Checks if a string starts with another string.
#
# Params:
#    DATA: The string to check.
#    END: The end of the string.
#
function startsWith() {
    grep -qE "^"$2 <<< $1
}

# Checks if a string ends with another string.
#
# Params:
#    DATA: The string to check.
#    END: The end of the string.
#
function endsWith() {
    grep -qE $2"$" <<< $1
}

# Makes a path end with a slash if it doesn't
#
# Params:
#    PATH: The path to modify.
#
function makePathEndWithSlash() {
    echo "${1%/}/"
}

# Removes the trailing slashes from a string.
#
# Params:
#    PATH: The path to modify.
#
function removeTrailingSlashes() {
    echo $(sed "s/\(.\)\/*$/\1/" <<< $1)
}

# Sorts two paths alphabetically, which will make the older date come first (if the path is date-based).
#
# Params:
#     FIRST: The first item to sort.
#     SECOND: The second item to sort.
#
function getOlderPath() {
    (echo $1; echo $2) | sort | head -1
}

# Checks if a string contains a substring.
#
# Params:
#    HAYSTACK: The string to check if contains the given pattern.
#    NEEDLE: The substring to check if exists.
#
function contains() {
    grep -qE $2 <<< $1
}