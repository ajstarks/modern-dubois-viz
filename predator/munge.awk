
{
	data[$1] += $3
}

END {
	for (i=1990; i <= 2015; i++) {
		print i "\t" data[i]/1e6
	}

}