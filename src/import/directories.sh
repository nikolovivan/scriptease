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

# Contains functions that use other libraries to manipulate directories.

# Just for reference - how to check if a directory exists.
# if [ ! -d "$DATA_DIR" ]; then
#     mkdir $DATA_DIR
# fi

# Creates a directory with the given path if it does not exist. This
# is nothing more than just mkdir -p.
# Params:
#    DATA_DIR: The directory to create.
#
function createDirectoryIfNotExists() {
    local DATA_DIR=$1
    mkdir -p $DATA_DIR
}