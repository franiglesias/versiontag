rm -rf ../testRepo
mkdir ../testRepo
cd ../testRepo
git init > /dev/null 2>&1
git remote add origin ../testRemote/.git
git commit -m 'init' --allow-empty > /dev/null 2>&1
rm -rf ../testRemote
mkdir ../testRemote
cp -r .git ../testRemote > /dev/null 2>&1
git checkout -B test > /dev/null 2>&1
git tag v1.1.1 > /dev/null 2>&1

bash ../versiontag \
    --force \
    minor 'tag message' \
    | grep -v "\[test" #ignore line with commit message

