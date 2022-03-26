#!/bin/sh

awk '
#BEGIN {	FS="[\\[:\\] ]";}
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
		c=($i~/[0-9]+\[[0-9]+:[0-9]+\][0-9]+/)
		printf $i "\n"
		printf $c "\n\n"
		if ($c == "")
		{
			continue
		}
		
		a=sub(/([0-9]+)\[([0-9]+):([0-9]+)\]([0-9]+)/, "\\1\t\\2\t\\3\t\\4\n", $i)
		if ($a == "")
		{
			continue
		}
		#printf $a
	}
}
' msgrecord.txt > msgrecord
