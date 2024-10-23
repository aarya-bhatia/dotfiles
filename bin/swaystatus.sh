#!/bin/sh
. ~/.bash_profile
while echo Vol:$(sb-volume) Bat:$(sb-battery) Mem:$(sb-memory) $(sb-date); do sleep 2; done
