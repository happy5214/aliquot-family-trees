#!/bin/sh
grep -m 1 "^${1}->" ../*/*.txt ../Open/*/*/*.txt ../Primes/*/*/*/*.txt || grep -m 1 "[[:digit:]]->${1}$" ../Open/*/*/*.txt || grep -m 1 "i0: ${1}" ../Open/*/*/*.txt
