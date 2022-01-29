#!/bin/bash
# Push Swap Tester made by Arkhavy | ljohnson@student.42lyon.fr
# https://github.com/Arkhavy

informations()
{
	clear
	printf "=================================================="
	printf "\n${BOLD}	ARK PUSH SWAP TESTER INFORMATIONS$RESET\n"
	printf "=================================================="

	printf "\n\n"
	# Errors
	printf "${BOLD}Too Much Instructions$RESET	: $TMI\n"
	printf "${BOLD}Checker KO$RESET		: $CKO\n"
	printf "${BOLD}Checker Error$RESET		: $CERR\n"
	printf "${BOLD}TimeOut$RESET			: $TKO\n"
	printf "${BOLD}Leaks$RESET			: $LKO\n"
	printf "${BOLD}Crash$RESET			: $CRKO\n\n"

	# Parsing
	printf "$BOLD$UNDERLINE\nParsing tests$RESET\n\n"
	printf "${BOLD}1 <= test <= 20$RESET		: $OK2 if Error\\\n on STDERR and nothing on STDOUT\n"
	printf "${BOLD}21 <= test <= 33$RESET	: $OK2 if nothing on STDERR\n"
	printf "${BOLD}34 <= test <= 42$RESET	: $OK2 if nothing on STDERR and STDOUT\n\n"

	# Small
	printf "$BOLD$UNDERLINE\nSmall tests$RESET\n\n"
	printf "${BOLD}3 digits$RESET		: $OK2 <= 3 actions\n"
	printf "${FAINT}4 digits$RESET		: $OK2 <= 7 actions\n"
	printf "${BOLD}5 digits$RESET		: $OK2 <= 12 actions\n"
	printf "${FAINT}6 digits$RESET		: $OK2 <= 26 actions\n"
	printf "${FAINT}7 digits$RESET		: $OK2 <= 50 actions\n"
	printf "${FAINT}8 digits$RESET		: $OK2 <= 70 actions\n"
	printf "${FAINT}9 digits$RESET		: $OK2 <= 85 actions\n\n"

	# Medium
	printf "$BOLD$UNDERLINE\nMedium tests$RESET\n\n"
	printf "${FAINT}10 digits$RESET		: $OK2 <= 100 actions\n"
	printf "${FAINT}25 digits$RESET		: $OK2 <= 250 actions\n"
	printf "${FAINT}50 digits$RESET		: $OK2 <= 350 actions\n"
	printf "${FAINT}75 digits$RESET		: $OK2 <= 525 actions\n"
	printf "${BOLD}100 digits$RESET		: $OK5 < 700	$OK4 < 900	$OK3 < 1100	$OK2 < 1300	$OK1 < 1500\n\n"

	# Large
	printf "$BOLD$UNDERLINE\nLarge tests$RESET\n\n"
	printf "${FAINT}200 digits$RESET		: $OK5 < 1250	$OK4 < 1600	$OK3 < 1950	$OK2 < 2350	$OK1 < 2700\n"
	printf "${FAINT}300 digits$RESET		: $OK5 < 2650	$OK4 < 3400	$OK3 < 4150	$OK2 < 4950	$OK1 < 5700\n"
	printf "${FAINT}400 digits$RESET		: $OK5 < 4000	$OK4 < 5200	$OK3 < 6350	$OK2 < 7550	$OK1 < 8700\n"
	printf "${BOLD}500 digits$RESET		: $OK5 < 5500	$OK4 < 7000	$OK3 < 8500	$OK2 < 10000	$OK1 < 11500\n\n"
}