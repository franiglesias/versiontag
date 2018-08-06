cd ../testRepo

git tag v0.0.0 > /dev/null 2>&1

bash ../versiontag \
    current

git tag -d v0.0.0 > /dev/null 2>&1
git push origin :v0.0.0 > /dev/null 2>&1 || true
