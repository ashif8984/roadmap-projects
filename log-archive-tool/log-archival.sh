#!/bin/bash

# Script Functionality
# 1. Archive logs in tar.gz format from the source directory provided by the user
# 2. Name the archive file with date as - logs_archive_20240816_100648.tar.gz
# 3. Save the archive to another directory

# Advanced Features
# 4. Email archive updates to user through email
# 5. Send archive logs to remote server


# Define a function
archive()
{

    local source_dir=$1
    local dest_dir=$2
    dest_dir=${dest_dir:-`pwd`}

    # Archive logs
    tar -cvf - $source_dir/* > $dest_dir/logs_archive_$(date +%Y%m%d-%H%M%S).tar.gz > /dev/null 2>&1

}

VARNAME=${1:?"Atleast 1 arg is required(Source Dir)"}


archive $1 $2


