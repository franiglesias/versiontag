#!/usr/bin/env bash
cd ../testRepo

git tag -d v1.1.1 > /dev/null 2>&1
git push origin :v1.1.1 > /dev/null 2>&1 || true
git tag -d v1.2.0 > /dev/null 2>&1
git push origin :v1.2.0 > /dev/null 2>&1 || true
