#!/bin/bash
# Push Swap Tester made by Arkhavy | ljohnson@student.42lyon.fr
# https://github.com/Arkhavy

# If you named your binary or if you have a different checker, you can change those two
NAME="../push_swap"
CHECKER="./checker_Mac"

# Don't change this one otherwise nothing will work correctly
ARKPATH="$(cd "$(dirname "$0")" && pwd -P)"

###############################################################################
#		SOURCE FILES
###############################################################################

source "${ARKPATH}"/srcs/varfile.sh
source "${ARKPATH}"/srcs/informations.sh
source "${ARKPATH}"/srcs/parsing_tests.sh
source "${ARKPATH}"/srcs/normal_tests.sh
source "${ARKPATH}"/srcs/big_tests.sh

###############################################################################
#		FLAG HANDLER
###############################################################################

if [ $# -eq 0 ]
then
	FLAG_P=1
	FLAG_S=1
	FLAG_OS=1
	FLAG_M=1
	FLAG_OM=1
	FLAG_L=1
	FLAG_OL=1
	i=0
	a=0
	for i in ${BLIST[@]}
	do
		BLIST[$a]=1
		a=$(($a + 1))
	done
else
	for arg in $@
	do
		case "${arg}" in
			"-h")	man "${ARKPATH}/srcs/help.1"
					exit ;;
			"-i")	informations
					exit ;;
			"-p")	FLAG_P=1
					BLIST[0]=1 ;;
			"-s")	FLAG_S=1
					BLIST[1]=1
					BLIST[3]=1 ;;
			"-os")	FLAG_OS=1
					FLAG_S=1
					BLIST[1]=1
					BLIST[2]=1
					BLIST[3]=1
					BLIST[4]=1
					BLIST[5]=1
					BLIST[6]=1
					BLIST[7]=1 ;;
			"-m")	FLAG_M=1
					BLIST[12]=1 ;;
			"-om")	FLAG_OM=1
					FLAG_M=1
					BLIST[8]=1
					BLIST[9]=1
					BLIST[10]=1
					BLIST[11]=1
					BLIST[12]=1 ;;
			"-l")	FLAG_L=1
					BLIST[16]=1 ;;
			"-ol")	FLAG_OL=1
					FLAG_L=1
					BLIST[13]=1
					BLIST[14]=1
					BLIST[15]=1
					BLIST[16]=1 ;;
		esac
	done
fi

###############################################################################
#		CONFIGURATION DISPLAY
###############################################################################

cd "${ARKPATH}"

clear
rm -rf $FTR
printf "# Push Swap Tester made by Arkhavy | ljohnson@student.42lyon.fr\n# https://github.com/Arkhavy\n" >> $FTR
printf "# This file will contain every fail you might have while running the tester, have fun !\n\n" >> $FTR

printf "=================================================="
printf "$BOLD\n	ARK PUSH SWAP TESTER\n$RESET"
printf "=================================================="

# Check if Binary and Checker exists
if [ ! -f $NAME ]
then
	printf $BOLD"\n\nNo binary found !\n\n"$RESET
	exit
fi
if [ ! -f $CHECKER ]
then
	printf $BOLD"\n\nNo checker found !\n\n"$RESET
	exit
fi

printf "\n\n${BOLD}Actual test configuration :${RESET}\n"

set $FLAG_P $FLAG_S $FLAG_OS $FLAG_M $FLAG_OM $FLAG_L $FLAG_OL
x=1
for arg in $@
do
	e=$(($x + 109))
	FLG="$(sed -n ${e}p $FF | tr -d '#')"
	if [ ${arg} -eq 0 ]
	then
		printf "$RED$FAINT	${FLG} disabled$RESET\n"
	else
		printf "$GREEN$BOLD	${FLG} enabled$RESET\n"
	fi
	x=$(($x + 1))
done

###############################################################################
#		START OF SCRIPT
###############################################################################

# Will need to add leak, crash and timeout tests into the loop
x=0
while [ $x -lt 17 ]
do
	if [ ${BLIST[$x]} -eq 1 ]
	then
		if [ $x -eq 0 ]
		then
			parsing_tests
		elif [ $x -gt 11 ]
		then
			big_tests
		else
			normal_tests
		fi
	fi
	x=$(($x + 1))
done