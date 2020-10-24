#!/bin/sh
# https://nbviewer.jupyter.org/github/charlieeatonphd/agilepredators/blob/master/Predators_Figure1_20200116.ipynb
#
csvread 1 11 13 < pred.csv | awk -F$'\t' '$2 == "Publicly traded" && $1 >= 1990 && $1 <= 2015 {print $1 "\t" $2 "\t" $3}' | awk -F$'\t' -f munge.awk > pubtrade.d
csvread 1 11 13 < pred.csv | awk -F$'\t' '$2 == "Private equity"  && $1 >= 1990 && $1 <= 2015 {print $1 "\t" $2 "\t" $3}' | awk -F$'\t' -f munge.awk > priveq.d
csvread 1 11 13 < pred.csv | awk -F$'\t' '$2 == "Privately held"  && $1 >= 1990 && $1 <= 2015 {print $1 "\t" $2 "\t" $3}' | awk -F$'\t' -f munge.awk > privheld.d
paste priveq.d   privheld.d pubtrade.d | awk '{print $1 "," $2 "," $4 "," $6}' > all.csv
paste priveq.d   privheld.d            | awk '{print $1 "\t" $2+$4}' > privsum.d
paste privheld.d pubtrade.d            | awk '{print $1 "\t" $2+$4}' > privheld+pubsum.d
