#!/bin/sh

[ -z $1 ] && echo "No year provided" && exit 1
csv_list=$(curl -s https://www.ncei.noaa.gov/data/global-hourly/access/$1/ | sed -r "s/.*\"(.*csv)\".*/\1/g" | grep .csv)
if [ ! -z $2 ]
then
	csv_list=$($csv_list | tail -n $2)
fi
echo $csv_list
exit
for line in $csv_list
do
	wget https://www.ncei.noaa.gov/data/global-hourly/access/$1/$line
done
# utiliser tail -n 1 pour récupérer la dernière ligne de la requête et comparer le nom de l'ancien fichier csv avec le nouveau

#while read line;
#do
#	echo $line
	#curl https://www.ncei.noaa.gov/data/global-hourly/access/2021/
#done < $(sed -r "s/.*\"(.*csv)\".*/\1/g" result.txt | grep .csv)
