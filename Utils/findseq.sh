#!/bin/sh
grep -m 1 "^${1}->" ../*/*.txt ../*/*/*.txt ../*/*/*/*.txt || grep -m 1 "[[:digit:]]->${1}$" ../Open/*/*/*.txt || grep -m 1 "i0: ${1}" ../Open/*/*/*.txt
