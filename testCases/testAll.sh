#!/usr/bin/env bash

set -e

cd "$(dirname "$0")"

function runCallBack() {
    if [ -f "$1" ]; then
        bash "$1"
    fi
}

printf "\e[90m"
printf '%s\n' ">>> Preparing scenario..."
printf '%s\n' "SRC  Test"
printf '%s\n' "============================="
printf "\e[0m";

runCallBack "./globalSetup.sh"

countTests=0
countFailed=0

for testCase in $(ls -d */)
do
{
    countTests=$((countTests + 1))

    printf "\e[90m"

    runCallBack "./setUp.sh"

    printf "."

    expected="$(cat $testCase/expected)"

    printf "."

    actual="$(bash $testCase/command.sh)"

    printf ".  "

    runCallBack "./tearDown.sh"

    if [ "$expected" == "$actual" ]
    then
        printf "\e[32m"
        printf '%-3s' "*"
        printf "\e[0m";
        printf '%s\n' "${testCase/%?}";
        continue 1;
    fi

    countFailed=$((countFailed + 1))

    printf "\e[31m"
    printf '%-3s' "!"
    printf '%s\n' "${testCase/%?}";
    printf "\e[0m";

    diff \
        --old-line-format=$'\e[33m- %L\e[0m' \
        --new-line-format=$'\e[31m+ %L\e[0m' \
        --unchanged-line-format=$'\e[37m  %L\e[0m' \
        <(echo "$expected") \
        <(echo "$actual")
}
done

printf "\e[90m"
printf '%s\n' "============================="
printf '%s\n' ">>> Cleaning scenario..."
printf "\e[0m";

runCallBack "./globalTearDown.sh"

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
