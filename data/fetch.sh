#!/bin/sh

[ -z $1 ] && echo "No year provided" && exit 1
curl -s https://www.ncei.noaa.gov/data/global-hourly/access/$1/ | sed -r "s/.*\"(.*csv)\".*/\1/g" | grep ".csv" > csv_list
if [ ! -z $2 ]
then
       echo "provided"
       cat csv_list | tail -n $2 > csv_list_short
fi
mv csv_list_short csv_list
for line in $(cat ./csv_list)
do
	wget https://www.ncei.noaa.gov/data/global-hourly/access/$1/$line
done
cat csv_list | tail -n 1 > last_$1_file_downloaded.txt
rm csv_list

#while read line;
#do
#	echo $line
	#curl https://www.ncei.noaa.gov/data/global-hourly/access/2021/
#done < $(sed -r "s/.*\"(.*csv)\".*/\1/g" result.txt | grep .csv)
