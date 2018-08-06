cd ../testRepo
git tag v1.1.1 > /dev/null 2>&1

bash ../versiontag \
    --force \
    major -m 'tag message'\
    | grep -v "\[test" #ignore line with commit message

git tag -d v1.1.1 > /dev/null 2>&1
git push origin :v1.1.1 > /dev/null 2>&1 || true
git tag -d v2.0.0 > /dev/null 2>&1
git push origin :v2.0.0 > /dev/null 2>&1 || true
