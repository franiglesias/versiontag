rm -rf ../testRepo
mkdir ../testRepo
cd ../testRepo
git init > /dev/null 2>&1
git commit -m 'init' --allow-empty > /dev/null 2>&1
git tag v0.0.0 > /dev/null 2>&1

bash ../versiontag \
    current
