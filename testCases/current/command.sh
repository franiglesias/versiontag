cd ../testRepo
git tag v1.1.1 > /dev/null 2>&1

bash ../versiontag \
    current

git tag -d v1.1.1 > /dev/null 2>&1
git push origin :v1.1.1 > /dev/null 2>&1 || true
