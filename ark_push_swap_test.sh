# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ark_push_swap_test.sh                              :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ljohnson <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/31 16:10:32 by ljohnson          #+#    #+#              #
#    Updated: 2022/01/05 16:55:01 by ljohnson         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#!/bin/bash
# Just a script to test combinations of digits for Push_Swap

NAME="../push_swap"
CHECKER="./checker_Mac"

# colors
BLACK="\e[30m"
RED="\e[31m"
LIGHT_RED="\e[91m"
GREEN="\e[32m"
LIGHT_GREEN="\e[92m"
YELLOW="\e[33m"
LIGHT_YELLOW="\e[93m"
BLUE="\e[34m"
LIGHT_BLUE="\e[94m"
PURPLE="\e[35m"
LIGHT_PURPLE="\e[95m"
CYAN="\e[36m"
LIGHT_CYAN="\e[96m"
WHITE="\e[37m"

# text
RESET="\e[0m"
BOLD="\e[1m"
FAINT="\e[2m"
ITALIC="\e[3m"
UNDERLINE="\e[4m"

# OK and KO
OK5=$LIGHT_PURPLE"OK"$RESET
OK4=$BLUE"OK"$RESET
OK3=$CYAN"OK"$RESET
OK2=$GREEN"OK"$RESET
OK1=$YELLOW"OK"$RESET
KO=$RED"KO"$RESET
TMI=$RED"TMI"$RESET
CKO=$FAINT$RED"CKO"$RESET

# files
D1="comb/parsing_tests.txt"
D3="comb/3digits_combinations.txt"
D4="comb/4digits_combinations.txt"
D5="comb/5digits_combinations.txt"
D6="comb/6digits_combinations.txt"
D10="comb/10digits_combinations.txt"
D25="comb/25digits_combinations.txt"
D100="comb/100digits_combinations.txt"
D500="comb/500digits_combinations.txt"
DOUT="comb/st_out.txt"
DERR="comb/st_err.txt"

clear

printf "=================================================="
printf "$BOLD\nARK PUSH SWAP TESTER START\n$RESET"
printf "=================================================="

###############################################################################
#							Parsing tests
###############################################################################

if [ ! -f $NAME ]
then
	printf $BOLD"\n\nNo binary found !\n"$RESET
	exit
fi
if [ ! -f $CHECKER ]
then
	printf $BOLD"\n\nNo checker found !\n"$RESET
	exit
fi

x=1
stop=0
printf $BOLD$UNDERLINE"\n\nParsing tests\n"$RESET
while [ $x -le 20 ] # Error\n on stderr, nothing on stdout or KO
do
	COMB="$(sed -n ${x}p $D1)"
	N="$($NAME $COMB 1>$DOUT 2>$DERR)"
	CDOUT="$(sed -n 1p $DOUT)"
	CDERR="$(sed -n 1p $DERR)"
	if [[ -n $CDOUT || ! $CDERR == "Error" ]]
	then
		printf "$x.$KO"
		stop=1
	else
		printf "$x.$OK2"
	fi
	if [ $(($x % 10)) -eq 0 ]
	then
		printf "\n"
	else
		printf "	"
	fi
	x=$(($x + 1))
done
rm $DOUT $DERR

x=21
while [ $x -le 33 ] # Nothing on stderr or KO
do
	COMB="$(sed -n ${x}p $D1)"
	N="$($NAME $COMB 1>$DOUT 2>$DERR)"
	CDOUT="$(sed -n 1p $DOUT)"
	CDERR="$(sed -n 1p $DERR)"
	if [[ -n $CDERR ]]
	then
		printf "$x.$KO"
		stop=1
	else
		printf "$x.$OK2"
	fi
	if [ $(($x % 10)) -eq 0 ]
	then
		printf "\n"
	else
		printf "	"
	fi
	x=$(($x + 1))
done
rm $DOUT $DERR

x=34
while [ $x -le 42 ] # nothing on both or KO
do
	COMB="$(sed -n ${x}p $D1)"
	N="$($NAME $COMB 1>$DOUT 2>$DERR)"
	CDOUT="$(sed -n 1p $DOUT)"
	CDERR="$(sed -n 1p $DERR)"
	if [[ -n $CDOUT || -n $CDERR ]]
	then
		printf "$x.$KO"
		stop=1
	else
		printf "$x.$OK2"
	fi
	if [ $(($x % 10)) -eq 0 ]
	then
		printf "\n"
	else
		printf "	"
	fi
	x=$(($x + 1))
done
rm $DOUT $DERR

if [ $stop -eq 1 ]
then
	printf $BOLD"\nBetter check those errors before starting real tests !\n"$RESET
	exit
else
	printf "\n"
fi

###############################################################################
#							3 digits combinations
###############################################################################

x=1
printf $BOLD$UNDERLINE"\n3 digits combinations\n"$RESET
while [ $x -le 6 ]
do
	COMB="$(sed -n ${x}p $D3)"
	N="$($NAME $COMB | wc -l)"
	CHECK="$($NAME $COMB | $CHECKER $COMB)"
	if [ $CHECK = "KO" ]
	then
		printf "$x.$CKO"
	else
		if [ $N -lt 4 ]
		then
			printf "$x.$OK2"
		else
			printf "$x.$TMI"
		fi
	fi
	if [ $x -eq 6 ]
	then
		printf "\n"
	else
		printf "	"
	fi
	x=$(($x + 1))
done


###############################################################################
#							4 digits combinations
###############################################################################

x=1
printf $BOLD$UNDERLINE"\n4 digits combinations\n"$RESET
while [ $x -le 24 ]
do
	COMB="$(sed -n ${x}p $D4)"
	N="$($NAME $COMB | wc -l)"
	CHECK="$($NAME $COMB | $CHECKER $COMB)"
	if [ $CHECK = "KO" ]
	then
		printf "$x.$CKO"
	else
		if [ $N -lt 8 ]
		then
			printf "$x.$OK2"
		else
			printf "$x.$TMI"
		fi
	fi
	if [ $(($x % 10)) -eq 0 ]
	then
		printf "\n"
	else
		printf "	"
	fi
	x=$(($x + 1))
done
printf "\n"

###############################################################################
#							5 digits combinations
###############################################################################

x=1
printf $BOLD$UNDERLINE"\n5 digits combinations\n"$RESET
while [ $x -le 120 ]
do
	COMB="$(sed -n ${x}p $D5)"
	N="$($NAME $COMB | wc -l)"
	CHECK="$($NAME $COMB | $CHECKER $COMB)"
	if [ $CHECK = "KO" ]
	then
		printf "$x.$CKO"
	else
		if [ $N -lt 13 ]
		then
			printf "$x.$OK2"
		else
			printf "$x.$TMI"
		fi
	fi
	if [ $(($x % 10)) -eq 0 ]
	then
		printf "\n"
	else
		printf "	"
	fi
	x=$(($x + 1))
done

###############################################################################
#							6 digits combinations
###############################################################################

x=1
printf $BOLD$UNDERLINE"\n6 digits combinations\n"$RESET
while [ $x -le 720 ]
do
	COMB="$(sed -n ${x}p $D6)"
	N="$($NAME $COMB | wc -l)"
	CHECK="$($NAME $COMB | $CHECKER $COMB)"
	if [ $CHECK = "KO" ]
	then
		printf "$x.$CKO"
	else
		if [ $N -lt 27 ]
		then
			printf "$x.$OK2"
		else
			printf "$x.$TMI"
		fi
	fi
	if [ $(($x % 10)) -eq 0 ]
	then
		printf "\n"
	else
		printf "	"
	fi
	x=$(($x + 1))
done

###############################################################################
#							10 digits combinations
###############################################################################

x=1
printf $BOLD$UNDERLINE"\n10 digits combinations\n"$RESET
while [ $x -le 1000 ]
do
	COMB="$(sed -n ${x}p $D10)"
	N="$($NAME $COMB | wc -l)"
	CHECK="$($NAME $COMB | $CHECKER $COMB)"
	if [ $CHECK = "KO" ]
	then
		printf "$x.$CKO"
	else
		if [ $N -lt 100 ]
		then
			printf "$x.$OK2"
		else
			printf "$x.$TMI"
		fi
	fi
	if [ $(($x % 10)) -eq 0 ]
	then
		printf "\n"
	else
		printf "	"
	fi
	x=$(($x + 1))
done

###############################################################################
#							25 digits combinations
###############################################################################

x=1
printf $BOLD$UNDERLINE"\n25 digits combinations\n"$RESET
while [ $x -le 1000 ]
do
	COMB="$(sed -n ${x}p $D25)"
	N="$($NAME $COMB | wc -l)"
	CHECK="$($NAME $COMB | $CHECKER $COMB)"
	if [ $CHECK = "KO" ]
	then
		printf "$x.$CKO"
	else
		if [ $N -lt 250 ]
		then
			printf "$x.$OK2"
		else
			printf "$x.$TMI"
		fi
	fi
	if [ $(($x % 10)) -eq 0 ]
	then
		printf "\n"
	else
		printf "	"
	fi
	x=$(($x + 1))
done

###############################################################################
#							100 digits combinations
###############################################################################

x=1
printf $BOLD$UNDERLINE"\n100 digits combinations\n"$RESET
while [ $x -le 1000 ]
do
	COMB="$(sed -n ${x}p $D100)"
	N="$($NAME $COMB | wc -l)"
	CHECK="$($NAME $COMB | $CHECKER $COMB)"
	if [ $CHECK = "KO" ]
	then
		printf "$x.$CKO"
	else
		if [ $N -lt 700 ]
		then
			printf "$x.$OK5"
		elif [ $N -lt 900 ]
		then
			printf "$x.$OK4"
		elif [ $N -lt 1100 ]
		then
			printf "$x.$OK3"
		elif [ $N -lt 1300 ]
		then
			printf "$x.$OK2"
		elif [ $N -lt 1500 ]
		then
			printf "$x.$OK1"
		else
			printf "$x.$TMI"
		fi
	fi
	if [ $(($x % 10)) -eq 0 ]
	then
		printf "\n"
	else
		printf "	"
	fi
	x=$(($x + 1))
done

###############################################################################
#							500 digits combinations
###############################################################################

x=1
printf $BOLD$UNDERLINE"\n500 digits combinations\n"$RESET
while [ $x -le 1000 ]
do
	COMB="$(sed -n ${x}p $D500)"
	N="$($NAME $COMB | wc -l)"
	CHECK="$($NAME $COMB | $CHECKER $COMB)"
	if [ $CHECK = "KO" ]
	then
		printf "$x.$CKO"
	else
		if [ $N -lt 5500 ]
		then
			printf "$x.$OK5"
		elif [ $N -lt 7000 ]
		then
			printf "$x.$OK4"
		elif [ $N -lt 8500 ]
		then
			printf "$x.$OK3"
		elif [ $N -lt 10000 ]
		then
			printf "$x.$OK2"
		elif [ $N -lt 11500 ]
		then
			printf "$x.$OK1"
		else
			printf "$x.$TMI"
		fi
	fi
	if [ $(($x % 10)) -eq 0 ]
	then
		printf "\n"
	else
		printf "	"
	fi
	x=$(($x + 1))
done

printf "\n${BOLD}${UNDERLINE}SCORES$RESET\n"
printf "${BOLD}3 digits$RESET		: $OK2 < 4 actions\n"
printf "${BOLD}4 digits$RESET		: $OK2 < 8 actions\n"
printf "${BOLD}5 digits$RESET		: $OK2 < 12 actions\n"
printf "${BOLD}6 digits$RESET		: $OK2 < 27 actions\n"
printf "${BOLD}10 digits$RESET		: $OK2 < 100 actions\n"
printf "${BOLD}25 digits$RESET		: $OK2 < 250 actions\n"
printf "${BOLD}100 digits$RESET		: $OK5 < 700	$OK4 < 900	$OK3 < 1100	$OK2 < 1300	$OK1 < 1500\n"
printf "${BOLD}500 digits$RESET		: $OK5 < 5500	$OK4 < 7000	$OK3 < 8500	$OK2 < 10000	$OK1 < 11500\n"
printf "${BOLD}Checker fail$RESET		: $CKO\n"
printf "${BOLD}Too Many Iterations$RESET	: $TMI\n"