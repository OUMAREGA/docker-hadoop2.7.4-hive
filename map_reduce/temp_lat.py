#!/usr/bin/env python3

import sys

# LATITUDE LONGITUDE TMP

# Déterminer la température minimale/maximale/moyenne selon la latitude - longitude

# Argument de l'opération doit être passé (min,max ou moy)

sys.argv.pop(0)

dico = {}

for line in sys.stdin:
    lat,lon,tmp = line.split('\t')
    tmp = float(tmp.replace(",","."))
    lat_lon = lat + "-" + lon
    if lat_lon not in dico:
        dico[lat_lon] = []

    dico[lat_lon].append(tmp)

if sys.argv[0] == "min" or sys.argv[1]:
    min_max(dico,sys.argv)
elif sys.argv[0] == "moy"
    moyenne(dico)


def min_max(dico,decision):
    for key in dico.keys():
        print("{}\t{}",key,min(dico[key]) if decision == "min" else max(dico[key]))


def moyenne(dico):
    for key in dico.keys():
        print("{}\t{}", key, sum(dico[key])/len(dico[key]))


