#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"

countTests=0
countFailed=0

for testCase in $(ls -d */)
do
{
	countTests=$((countTests + 1))

	printf "\e[96m";
	printf "### ";
	printf "\e[0m";
	printf "${testCase/%?}";

	expected="$(cat $testCase/expected)"

	actual="$(bash $testCase/command.sh)"

	if [ "$expected" = "$actual" ]
	then
		printf "\e[32m"
		printf '%s\n' " [ok]"
		continue 1;
	fi

	countFailed=$((countFailed + 1))

	printf "\e[31m"
	printf '%s\n' " [error]"

	printf "\e[96m"
	printf '%s\n' "--expected:"

	printf "\e[92m"
	echo "$expected"

	printf "\e[96m"
	printf '%s\n' "--actual:"

	printf "\e[35m"
	echo "$actual"
	printf "\e[0m"
}
done

if [ $countFailed -eq 0 ]
then
{
	printf '%s\n' "\e[32m"
	printf "Passed all $countTests tests."
}
else
{
	printf "\e[31m"
	printf "Failed $countFailed from $countTests tests."
}
fi

printf "\e[0m"
