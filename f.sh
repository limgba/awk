#!/bin/sh

awk '
{
	if (/min_total/)
	{
		next
	}
	for (i=1;i<=NF;i++)
	{
		if ($i~/type/)
		{
			printf "\n\n"
			continue
		}
		if ($i!~/[0-9]+\[[0-9]+:[0-9]+\][0-9]+/)
		{
			continue
		}
		
		printf $i "\n"
	}
}
' msgrecord.txt > msgrecord1

awk '
BEGIN {	FS="[\\[:\\]]";}
{
	for (i=1;i<=NF;i++)
	{
		printf $i
		if (i != NF)
		{
			printf "\t"
		}
		else
		{
			printf "\n"
		}
	}
}
' msgrecord1 > msgrecord

rm -rf msgrecord1

sort -nrk4 msgrecord | head -n20
rm -rf msgrecord
