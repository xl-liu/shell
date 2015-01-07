#!/bin/sh

IFS=$'\n'
entries=$(awk -F# '{print "\""$3"\""}' < log.entries);

for entry in ${entries}
do 
  echo "insert into logentry (content) values ("$entry");"
done | mysql -uroot -proot -A test;

# select count(*) as Frequency, content from logentry group by content order by Frequency;
