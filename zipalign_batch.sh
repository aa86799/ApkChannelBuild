if [ -d "release" ]
then
    if [ -d "release/zipaligned" ]
    then
        rm -rf "release/zipaligned"
    fi
    mkdir "release/zipaligned"
    for file in ./release/*
    do
        if test -f $file
        then
            echo "${file##*/}"
            /Users/stone/Documents/sdk/build-tools/25.0.2/zipalign -v 4 $file release/zipaligned/${file##*/}        
        fi
    done
else
    echo "No release folder, can not go on zipalign"
fi