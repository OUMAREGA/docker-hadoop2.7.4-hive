#!/bin/sh

[ -z $1 ] && echo "No year provided" && exit 1;

last_csv=$(curl -s https://www.ncei.noaa.gov/data/global-hourly/access/$1/ | sed -r "s/.*\"(.*csv)\".*/\1/g" | grep .csv | tail -n 1)
last_local_csv=$(cat last_$1_file_downloaded.txt) 
if [ "$last_local_csv" != "$last_csv" ]
then
	echo "needs to be synced"
	wget https://www.ncei.noaa.gov/data/global-hourly/access/$1/$last_csv
else
	echo "nothing to do"
fi


# utiliser tail -n 1 pour récupérer la dernière ligne de la requête et comparer le nom de l'ancien fichier csv avec le nouveau

#while read line;
#do
#	echo $line
	#curl https://www.ncei.noaa.gov/data/global-hourly/access/2021/
#done < $(sed -r "s/.*\"(.*csv)\".*/\1/g" result.txt | grep .csv)
