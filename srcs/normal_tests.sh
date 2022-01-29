#!/bin/bash
# Push Swap Tester made by Arkhavy | ljohnson@student.42lyon.fr
# https://github.com/Arkhavy

normal_tests()
{
	v=1
	a=1
	BEST=0
	LBEST=0
	WORST=0
	LWORST=0
	TOTAL=0
	AVERAGE=0
	N=0
	printf "$BOLD$UNDERLINE\n${NLIST[$x]} digits combinations$RESET\n\n"
	while [ $v -le ${LIMIT_LIST[$x]} ]
	do
		COMB="$(sed -n ${v}p ${DCLIST[$x]})"
		CHECK="$($NAME $COMB | $CHECKER $COMB)"
		if [ $CHECK = "KO" ]
		then
			echo "CKO = $COMB" >> $FTR
			printf "$v.$CKO"
		elif [ $CHECK = "Error" ]
		then
			echo "CERR = $COMB" >> $FTR
			printf "$v.$CERR"
		else
			N="$($NAME $COMB | wc -l | tr -d ' ')"
			if [ $N -le ${INST_LIST[$x]} ]
			then
				printf "$v.$OK2"
			else
				echo "TMI $N instructions = $COMB" >> $FTR
				printf "$v.$TMI"
			fi
			if [[ $BEST -eq 0 || $N -le $BEST ]]
			then
				BEST="$N"
				LBEST="$v"
			fi
			if [[ $WORST -eq 0 || $N -ge $WORST ]]
			then
				WORST="$N"
				LWORST="$v"
			fi
			TOTAL=$(($TOTAL + $N))
			AVERAGE=$(($TOTAL / $a))
			a=$(($a + 1))
		fi
		if [ $(($v % 10)) -eq 0 ] # Will need to check how to change that into one condtion
		then
			printf "\n"
		elif [[ $x -eq 1 && $v -eq 6 ]]
		then
			printf "\n"
		elif [[ $x -eq 2 && $v -eq 24 ]]
		then
			printf "\n"
		else
			printf "	"
		fi
		v=$(($v + 1))
	done
	printf "\n${BOLD}BEST$RESET	$GREEN$BEST$RESET	line $LBEST"
	printf "\n${BOLD}WORST$RESET	$RED$WORST$RESET	line $LWORST"
	printf "\n${BOLD}AVERAGE$RESET	$YELLOW$AVERAGE$RESET\n"
}