import sys
import csv

with sys.stdin as csvfile:
    reader = csv.DictReader(csvfile)
    for row in reader:
        print("{0}\t{1}".format(row["STATION"], row["TMP"]))
