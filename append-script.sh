#!/bin/bash

SYSTEMLOG="system.log"

echo "$(date): System log started" >>  $SYSTEMLOG
echo "$(date): System check completed" >> $SYSTEMLOG

cat $SYSTEMLOG
