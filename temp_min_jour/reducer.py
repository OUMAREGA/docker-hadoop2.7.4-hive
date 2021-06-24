#!/usr/bin/env python3

from datetime import datetime
import sys

dico = {}
for line in sys.stdin:
    date,temp = line.split('\t')
    temp=float(temp.replace(',','.'))
    # 2021-06-21T21:00:00
    day = date.split('T')
    if day[0] not in dico:
        dico[day[0]] = []
    dico[day[0]].append(temp);

for day in dico.keys():
    dico[day].sort(reverse=True)
    print(f"{day}\t{dico[day][0]}")
