#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"

function runCallBack() {
    if [ -f "$1" ]; then
        bash "$1"
    fi
}

runCallBack "./setUp.sh"

countTests=0
countFailed=0

printf "\e[90m"
printf '%s\n' "SRC  Result  Test"
printf '%s\n' "============================="
printf "\e[0m";

for testCase in $(ls -d */)
do
{
    countTests=$((countTests + 1))

printf "\e[90m"
printf '%s' "."
printf "\e[0m";

    runCallBack "$testCase/setUp.sh"

    expected="$(cat $testCase/expected)"

printf "\e[90m"
printf '%s' "."
printf "\e[0m";

    actual="$(bash $testCase/command.sh)"

printf "\e[90m"
printf '%s' ".  "
printf "\e[0m";

    runCallBack "$testCase/tearDown.sh"

    if [ "$expected" == "$actual" ]
    then
        printf "\e[32m"
        printf '%s' "[ok]    "
        printf "\e[0m";
        printf '%s\n' "${testCase/%?}";
        continue 1;
    fi

    countFailed=$((countFailed + 1))

    printf "\e[31m"
    printf "[fail] "
    printf "\e[0m";

    printf '%s\n' "${testCase/%?}";

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

printf "\e[90m"
printf '%s\n' "============================="
printf "\e[0m";

runCallBack "./tearDown.sh"

printf -- "\n"

if [ $countFailed -eq 0 ]
then
{
    printf "\e[32m"
    printf '%s\n' "Passed all $countTests tests."
}
else
{
    printf "\e[31m"
    printf '%s\n' "Failed $countFailed from $countTests tests."
}
fi

printf "\e[0m"
printf -- "\n"
