#!/usr/bin/env bash

major=1
minor=2
patch=4

msg=''

	exec 3<> .semver

	:> .semver
	echo "---" >&3
	echo ":major: $major" >&3
	echo ":minor: $minor" >&3
	echo ":patch: $patch" >&3
	echo >&3
	
	echo ":notes: $msg" >&3
	echo
	exec 3>&-

