#!/bin/bash
# Made by Arkhavy | ljohnson@student.42lyon.fr
# https://github.com/Arkhavy

###############################################################################
#		FILES
###############################################################################

# script files
FM="../arktest.sh"
FI="srcs/informations.sh"
FF="srcs/varfile.sh"
FPT="srcs/parsing_tests.sh"
FNT="srcs/normal_tests.sh"
FBT="srcs/big_tests.sh"

FTR="trace.txt"
FOUT="srcs/f_out.txt"
FERR="srcs/f_err.txt"

# parsing # Parsing tests
DCP="comb/parsing_combinations.txt"

# small # Normal tests
DC3="comb/3digits_combinations.txt"
DC5="comb/5digits_combinations.txt"

# small optional # Normal tests
DC4="comb/4digits_combinations.txt"
DC6="comb/6digits_combinations.txt"
DC7="comb/7digits_combinations.txt"
DC8="comb/8digits_combinations.txt"
DC9="comb/9digits_combinations.txt"

# medium # Big tests
DC100="comb/100digits_combinations.txt"

# medium optional # Normal tests
DC10="comb/10digits_combinations.txt"
DC25="comb/25digits_combinations.txt"
DC50="comb/50digits_combinations.txt"
DC75="comb/75digits_combinations.txt"

# large # Big tests
DC500="comb/500digits_combinations.txt"

# large optional # Big tests
DC200="comb/200digits_combinations.txt"
DC300="comb/300digits_combinations.txt"
DC400="comb/400digits_combinations.txt"

###############################################################################
#		VARIABLES
###############################################################################

# flags
FLAG_P=0
FLAG_S=0
FLAG_OS=0
FLAG_M=0
FLAG_OM=0
FLAG_L=0
FLAG_OL=0

# lists of files and vars
DCLIST=($DCP $DC3 $DC4 $DC5 $DC6 $DC7 $DC8 $DC9 $DC10 $DC25 $DC50 $DC75 $DC100 $DC200 $DC300 $DC400 $DC500)
NLIST=('p' '3' '4' '5' '6' '7' '8' '9' '10' '25' '50' '75' '100' '200' '300' '400' '500')
BLIST=('0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0' '0')
LIMIT_LIST=('42' '6' '24' '120' '720' '500' '500' '500' '500' '500' '500' '500' '500' '500' '500' '500' '500')
INST_LIST=('0' '3' '7' '12' '26' '50' '70' '85' '100' '250' '350' '525' '0' '0' '0' '0' '0')
FLAG_LIST=($FLAG_P $FLAG_S $FLAG_OS $FLAG_M $FLAG_OM $FLAG_L $FLAG_OL)

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
TKO=$FAINT$YELLOW"TO"$RESET
LKO=$FAINT$YELLOW"LEAKS"$RESET
CRKO=$FAINT$YELLOW"CRASH"$RESET
CERR=$FAINT$RED"CERR"$RESET

#Parsing
#Small
#Small Optional
#Medium
#Medium Optional
#Large
#Large Optional