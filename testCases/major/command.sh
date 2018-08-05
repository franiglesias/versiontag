cd ../testRepo

bash ../versiontag \
    --force \
    major 'tag message' \
    | grep -v "\[test" #ignore line with commit message

