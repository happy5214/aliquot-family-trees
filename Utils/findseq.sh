#!/bin/sh
grep -m 1 "^${1}->" ../*/*.txt ../*/*/*.txt
