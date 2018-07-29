#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"

countTests=0
countFailed=0

for testCase in $(ls -d */)
do
{
	countTests=$((countTests + 1))

	echo -ne "\e[96m";
	echo -ne "### ";
	echo -ne "\e[0m";
	echo -ne "${testCase::-1}";

	expected="$(cat $testCase/expected)"

	actual="$(bash $testCase/command.sh)"

	if [ "$expected" == "$actual" ]
	then
		echo -ne "\e[32m"
		echo -e " [ok]"
		continue;
	fi

	countFailed=$((countFailed + 1))

	echo -ne "\e[31m"
	echo -e " [error]"

	echo -ne "\e[96m"
	echo -e "--expected:"

	echo -ne "\e[92m"
	echo "$expected"

	echo -ne "\e[96m"
	echo -e "--actual:"

	echo -ne "\e[35m"
	echo "$actual"
	echo -ne "\e[0m"
}
done

if [ $countFailed -eq 0 ]
then
{
	echo -e "\e[32m"
	echo -ne "Passed all $countTests tests."
}
else
{
	echo -e "\e[31m"
	echo -ne "Failed $countFailed from $countTests tests."
}
fi

echo -e "\e[0m"
