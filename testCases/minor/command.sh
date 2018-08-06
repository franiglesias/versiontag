cd ../testRepo
git tag v1.1.1 > /dev/null 2>&1

bash ../versiontag \
    --force \
    minor 'tag message' \
    | grep -v "\[test" #ignore line with commit message

git tag -d v1.1.1 > /dev/null 2>&1
git push origin :v1.1.1 > /dev/null 2>&1 || true
git tag -d v1.2.0 > /dev/null 2>&1
git push origin :v1.2.0 > /dev/null 2>&1 || true
