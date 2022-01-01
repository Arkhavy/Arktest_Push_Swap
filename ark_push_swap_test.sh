# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    ark_push_swap_test.sh                              :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ljohnson <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/31 16:10:32 by ljohnson          #+#    #+#              #
#    Updated: 2022/01/01 15:03:49 by ljohnson         ###   ########lyon.fr    #
#                                                                              #
# **************************************************************************** #

#!/bin/bash
# Just a script to test combinations of digits for Push_Swap

NAME="../push_swap"
CHECKER="../checker_Mac"

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
CKO=$FAINT$RED"CKO"$RESET

# files
D3="comb/3digits_combinations.txt"
D4="comb/4digits_combinations.txt"
D5="comb/5digits_combinations.txt"
D6="comb/6digits_combinations.txt"
D10="comb/10digits_combinations.txt"
D25="comb/25digits_combinations.txt"
D100="comb/100digits_combinations.txt"
D500="comb/500digits_combinations.txt"

clear

printf "=================================================="
printf "$BOLD\nARK PUSH SWAP TESTER START\n$RESET"
printf "=================================================="

###############################################################################
#							3 digits combinations
###############################################################################

x=1
printf "\n3 digits combinations\n"
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
			printf "$x.$KO"
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
printf "\n4 digits combinations\n"
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
			printf "$x.$KO"
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
printf "\n5 digits combinations\n"
while [ $x -le 120 ]
do
	COMB="$(sed -n ${x}p $D5)"
	N="$($NAME $COMB | wc -l)"
	CHECK="$($NAME $COMB | $CHECKER $COMB)"
	if [ $CHECK = "KO" ]
	then
		printf "$x.$CKO"
	else
		if [ $N -lt 12 ]
		then
			printf "$x.$OK2"
		else
			printf "$x.$KO"
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
printf "\n6 digits combinations\n"
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
			printf "$x.$KO"
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
printf "\n10 digits combinations\n"
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
			printf "$x.$KO"
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
printf "\n25 digits combinations\n"
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
			printf "$x.$KO"
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
printf "\n100 digits combinations\n"
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
			printf "$x.$KO"
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
printf "\n500 digits combinations\n"
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
			printf "$x.$KO"
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
printf "${BOLD}3 digits$RESET : $OK2 < 4 actions else $KO\n"
printf "${BOLD}4 digits$RESET : $OK2 < 8 actions else $KO\n"
printf "${BOLD}5 digits$RESET : $OK2 < 12 actions else $KO\n"
printf "${BOLD}6 digits$RESET : $OK2 < 27 actions else $KO\n"
printf "${BOLD}10 digits$RESET : $OK2 < 100 actions else $KO\n"
printf "${BOLD}25 digits$RESET : $OK2 < 250 actions else $KO\n"
printf "${BOLD}100 digits$RESET : $OK5 < 700, $OK4 < 900, $OK3 < 1100, $OK2 < 1300, $OK1 < 1500 else $KO\n"
printf "${BOLD}500 digits$RESET : $OK5 < 5500, $OK4 < 7000, $OK3 < 8500, $OK2 < 10000, $OK1 < 11500 else $KO\n"
printf "${BOLD}Checker fail$RESET : $CKO\n"