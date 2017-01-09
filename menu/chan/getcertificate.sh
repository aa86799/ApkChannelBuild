#!/bin/bash
 
#使用方法 ./getcertificate.sh xx.apk
 
get_signature() {
    path=`jar tf "$1" | grep RSA` #查找apk中RSA文件
    jar xf $1 $path #把RSA文件解压出来
    keytool -printcert -file $path #查看指纹证书
    rm -r $path #删除之前解压的文件
}
 
mypath=`pwd`
filepath=""
if [ -d .temp_for_certificate ]
then
    echo ".temp_for_certificate is exist,remove it first!"
    exit
fi
 
mkdir .temp_for_certificate
cd .temp_for_certificate
count=0
while [ -n "$1" ] 
do 
    if [ `expr substr "$1" 1 1` = "/" ] #绝对路径
    then
        filepath="$1"
    else #相对路径
        filepath="$mypath/$1"
    fi
    if [ -d $filepath ]
    then
        all_apk=`find $filepath -name "*.apk"`
        for apk_path in $all_apk
        do
            count=$[$count+1]
            echo "(#$count) "`basename "$apk_path"`":"
            filepath=$apk_path
            get_signature "$filepath"
            echo "-----------------------------------------------------------"
        done
    else
        count=$[$count+1]
        echo "(#$count) "`basename "$1"`":"
        get_signature "$filepath"
        echo "-----------------------------------------------------------"
    fi
    shift
done 
cd ..
rm -r .temp_for_certificate
echo "done!"