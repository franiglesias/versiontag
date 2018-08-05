cd ../testRepo

bash ../versiontag \
    --force \
    minor 'tag message' \
    | grep -v "\[test" #ignore line with commit message
