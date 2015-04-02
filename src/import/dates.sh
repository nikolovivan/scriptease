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

# Contains functions related to date and time manipulations.

# Gets the date for N weeks ago from yesterday.
#   
# Params:
#    FROM_DATE: From which date to start.
#    N_WEEKS: The number of weeks back.
#    FORMAT: The format of the date. Optional. Default: YYYY-MM-dd
#
function getNWeeksAgo() {
    local FROM_DATE=$1
    local N_WEEKS=$2
    local FORMAT=${3:-"%Y-%m-%d"}
    local DATE=$(date -d ''$N_WEEKS' weeks ago '$FROM_DATE'' +$FORMAT  2>/dev/null || date -v-$N_WEEKS"w" -jf $FORMAT $FROM_DATE +$FORMAT)
    echo $DATE
}

# Gets the date for N days ago from the given day.
#
# Params:
#    FROM_DATE: From which date to start.
#    N_DAYS: The number of days back.
#    FORMAT: The format of the date. Optional. Default: YYYY-MM-dd
#
function getNDaysAgo() {
    local FROM_DATE=$1
    local N_DAYS=$2
    local FORMAT=${3:-"%Y-%m-%d"}
    local DATE=$(date -d ''$N_DAYS' days ago '$FROM_DATE'' +$FORMAT 2>/dev/null || date -v-$N_DAYS"d" -jf $FORMAT $FROM_DATE +$FORMAT)
    echo $DATE
}

# Gets the date for N days after the given day.
#
# Params:
#    FROM_DATE: From which date to start.
#    N_DAYS: The number of days forward.
#    FORMAT: The format of the date. Optional. Default: YYYY-MM-dd.
#
function getNDaysAfter() {
    local FROM_DATE=$1
    local N_DAYS=$2
    local FORMAT=${3:-"%Y-%m-%d"}
    local DATE=$(date -d ''$N_DAYS' days '$FROM_DATE'' +$FORMAT 2>/dev/null || date -v+$N_DAYS"d" -jf $FORMAT $FROM_DATE +$FORMAT)
    echo $DATE
}

# Validates a date and outputs it in the given format.
#    
# Params:
#    DATE: The date to validate.
#    FORMAT: The format of the date. Optional. Default: YYYY-MM-dd.
#
function validateDate() {
    local FORMAT=${2:-"%Y-%m-%d"}
    local LOC_DATE=$(date -d "$1" +$FORMAT 2>/dev/null || date -jf $FORMAT $1 +$FORMAT)    
    echo $LOC_DATE
}

# Gets the today's date.
# Params:
#    FORMAT: The format of the date. Optional. Default: YYYY-MM-dd.
#
function getToday() {
    local FORMAT=${1:-"%Y-%m-%d"}
    local DATE=$(date +$FORMAT 2>/dev/null || date +$FORMAT)
    echo $DATE
}

# Gets the yesterday's date.
# Params:
#    FORMAT: The format of the date. Optional. Default: YYYY-MM-dd.
#
function getYesterday() {
    local FORMAT=${1:-"%Y-%m-%d"}
    local DATE=$(date -d '1 day ago' +$FORMAT 2>/dev/null || date -v-1d +$FORMAT)
    echo $DATE
}

# Gets the difference in days between two dates. The first
# date should be the bigger one.
# Params:
#    DATE1: The first date.
#    DATE2: The second date.
#    FORMAT: The format of the dates. Optional. Default: YYYY-MM-dd.
#
function getDayDifference() {
    local DATE1=$1
    local DATE2=$2
    local FORMAT=${3:-"%Y-%m-%d"}
    local RESULT=$(( ($(date --date=$DATE1 +'%s' 2>/dev/null || date -jf $FORMAT $DATE1 +'%s')-$(date --date=$DATE2 +'%s' 2>/dev/null || date -jf $FORMAT $DATE2 +'%s'))/(60*60*24) ))
    echo $RESULT
}

# Gets the given date represented in seconds.
# Params:
#    DATE: The date to convert in seconds.
#    FORMAT: The format of the date. Optional. Default: YYYY-MM-dd.
#
function getDateInSeconds() {
    local DATE=$1
    local FORMAT=${2:-"%Y-%m-%d"}
    local RESULT=$(date --date=$DATE +'%s' 2>/dev/null || date -jf $FORMAT $DATE +'%s')
    echo $RESULT
}

# Reads a date and returns it in the given format.
# Params:
#    DATE: The date to convert.
#    FORMAT_TO: The format to convert the date to. Optional. Default: YYYY-MM-dd.
#    FORMAT_FROM: The format from which to convert the date. Optional. Default: YYYY-MM-dd.
#
function getDateInFormat() {
    local DATE=$1
    local FORMAT_TO=${2:-"%Y-%m-%d"}
    local FORMAT_FROM=${3:-"%Y-%m-%d"}
    local RESULT=$(date --date=$DATE +$FORMAT_TO 2>/dev/null || date -jf $FORMAT_FROM $DATE $FORMAT_TO)
    echo $RESULT
}