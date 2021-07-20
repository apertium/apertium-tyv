#!/bin/bash
LG=tyv
tests=`grep '!@' apertium-${LG}.${LG}.twol | cut -f2 -d'@'`
output=`echo "$tests" | hfst-pair-test -v .deps/${LG}.twol.hfst 2>/dev/null`
echo "$output";
echo "";
count=`echo "$tests" | wc -l`
pass=`echo "$output" | grep -c "PASSED"`
echo "";
echo $pass"/"$count" passed.";
