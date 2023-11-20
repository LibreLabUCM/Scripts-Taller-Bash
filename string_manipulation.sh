#!/bin/bash

grep -R 'while' . | cut -d ':' -f 1

grep -R if . | sort

grep -R if . | sort | cut -d ':' -f 2

grep -R if . | sort | cut -d ':' -f 2 | sed 's/^[[:blank:]]*//'

grep -R if . | sort | cut -d ':' -f 2 | sed 's/^[[:blank:]]*//' | sort | uniq

grep -R if . | sort | cut -d ':' -f 2 | sed 's/^[[:blank:]]*//' | sort | uniq | wc -l


