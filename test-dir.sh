#!/bin/bash

TESTDIR="$HOME/test-directory"

mkdir -p $TESTDIR
touch -d "20 days ago" $TESTDIR/old-script.tar.gz 
touch -d "10 days ago" $TESTDIR/new-script.tar.gz
touch -d "2 days ago" $TESTDIR/future-script.tar.gz

find $TESTDIR -name "*.tar.gz" -mtime +7 -delete

ls -lh $TESTDIR
