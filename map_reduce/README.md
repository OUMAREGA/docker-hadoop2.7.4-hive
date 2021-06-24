## Répertoire Map Reduce

Ici se trouve toutes les opérations d'agrégation sur les données de la NOAA

Le mapper étant générique, il peut interpréter n'importe quelle colonne des données CSV.
Il faut renseigner dans l'ordre donné, les colonnes souhaitées.

Rappel commande : Commande : `cat <fichier> | ./mapper.py <colonnes séparées avec espace> | ./<reducer> <critère>`

Rappel des colonnes :

- STATION
- DATE
- SOURCE
- LATITUDE
- LONGITUDE
- ELEVATION
- NAME
- REPORT_TYPE
- CALL_SIGN
- QUALITY_CONTROL
- WND
- CIG
- VIS
- TMP
- DEW
- SLP
- KA1
- KA2
- MA1
- MD1
- OC1
- OD1
- OD2
- REM
- EQD



####  Calcul de température par jour selon **critère** (colonnes requises : DATE, TMP, reducer : `temp_jour.py`) :

| Critère | Description | 
| ------- | :----------:|
|  `max`  |  Température maximale | 
|  `min`  |  Température minimale |
|  `moy`  |  Température moyenne  |  
|  `range`|  Écart de température (max - min) |



Le calcul de température **par longitude/latitude** fonctionne de la même façon qu'au dessus, mais les colonnes requises sont : LATITUDE, LONGITUDE et TMP, et le est reducer : `temp_lat.py`