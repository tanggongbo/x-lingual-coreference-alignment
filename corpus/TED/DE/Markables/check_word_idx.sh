#!/bin/bash

# check the tokenization of revised src, (after aligning sentences

for file_name in "000_779" "001_769" "002_792" "003_799" "004_767" "005_790" "006_785" "007_783" "008_824" "010_837"
do
    awk -f ../../../../scripts/make-sentence-level.awk ../Source/${file_name}.tok.de > ${file_name}_sentence_level.xml 
    diff ${file_name}_sentence_level.xml  new/${file_name}_sentence_level.xml > dif.${file_name}
done
