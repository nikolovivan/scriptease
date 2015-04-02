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

# Import the libraries
RUN_DIR=`dirname $0`
. $RUN_DIR/import/core.sh
. $RUN_DIR/import/dates.sh
. $RUN_DIR/import/paths.sh
. $RUN_DIR/import/directories.sh

# Now we can use any function from those libraries.

echo "Two weeks ago from today ($(getToday)) is $(getNWeeksAgo $(getToday) 2)."

echo "Three days before yesterday ($(getYesterday)) is $(getNDaysAgo $(getYesterday) 3)."

echo "Five days after today ($(getToday)) is $(getNDaysAfter $(getToday) 5)."

echo "There are $(getDayDifference 2015-05-29 2015-04-11) days between 2015-05-29 and 2015-04-11."

echo "2015-04-01 is $(getDateInSeconds 2015-04-01) in seconds."