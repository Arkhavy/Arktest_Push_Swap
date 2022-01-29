#!/bin/bash
# Push Swap Tester made by Arkhavy | ljohnson@student.42lyon.fr
# https://github.com/Arkhavy

parsing_tests()
{
	z=1
	printf "$BOLD$UNDERLINE\nParsing tests$RESET\n\n"
	while [ $z -le 42 ]
	do
		COMB="$(sed -n ${z}p $DCP)" # Get combination
		N="$($NAME $COMB 1>$FOUT 2>$FERR)" # Put result in files
		CDOUT="$(sed -n 1p $FOUT)" # Get result of stdout
		CDERR="$(sed -n 1p $FERR)" # Get result of stderr
		if [ $z -le 20 ]
		then
			if [[ -n $CDOUT || ! $CDERR == "Error" ]] # OK if Error\\\n on STDERR and nothing on STDOUT
			then
				echo "PARSING KO = $COMB" >> $FTR
				printf "$z.$KO"
			else
				printf "$z.$OK2"
			fi
		elif [[ $z -gt 20 && $z -le 33 ]]
		then
			if [[ -n $CDERR ]] # OK if nothing on STDERR
			then
				echo "PARSING KO = $COMB" >> $FTR
				printf "$z.$KO"
			else
				printf "$z.$OK2"
			fi
		elif [[ $z -gt 33 && $z -le 42 ]]
		then
			if [[ -n $CDOUT || -n $CDERR ]] # OK if nothing on both STDERR and STDOUT
			then
				echo "PARSING KO = $COMB" >> $FTR
				printf "$z.$KO"
			else
				printf "$z.$OK2"
			fi
		fi
		if [ $(($z % 10)) -eq 0 ]
		then
			printf "\n"
		else
			printf "	"
		fi
		z=$(($z + 1))
	done
	rm -rf $FOUT $FERR
}