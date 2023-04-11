#!/bin/bash

echo "$1"

echo "$2"

if [ "$2" != "*" ]; then
  sqlfiles=$(echo $2 | tr "," "\n")

  for addr in $sqlfiles
  do
    echo $1$addr
  done
fi

if [ "$2" = "*" ]; then
  for file in *.sql; do
    echo "$1$file"
  done
fi