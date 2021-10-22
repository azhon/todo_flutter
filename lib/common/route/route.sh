#!/bin/sh
#############################
# @author azhon
#
# 自动生成页面路由地址
# 文件名格式：*_page.dart
#############################
splitSymbol="_"
fileFormat="_page.dart"
page_array=()
index=0
read_file() {
    for file in `ls $1`
    do
        if [ -d $1"/"$file ];then
            read_file $1"/"$file
        else
             if echo "$file" | grep -q -E "\\$fileFormat"
             then
                # 根据文件名 转换成 upperCase格式
                upper_letter $file
                page_array[index]=$clsName
                index=`expr $index + 1`
            fi
        fi
    done

}
#字母转大写
upper_letter(){
  result=''
  params=$1
  # 删除".dart"
  params=${params%.*}
  #字符串_分割
  name_array=(${params//$splitSymbol/ })
  for name in ${name_array[@]}
  do
    firstLetter=${name:0:1}
    otherLetter=${name:1}
    firstLetter=$(echo $firstLetter | tr '[a-z]' '[A-Z]')
    result+=$firstLetter$otherLetter
  done
  clsName=$result
}
# 获取[/lib]目录下的所以page文件
read_file ../../
#生成文件
fileHint="///don't modify this file,use shell [route.sh] auto create.\n"
moduleName=''
startCode="$fileHint class ModuleRouteName {\n"
endCode="}"
echo "获取到需要生成路由的页面:\n${page_array[@]}"
for page in ${page_array[@]}
do
   line="  static const $page = \"$moduleName/$page\";"
   startCode=$startCode$line"\n"
done
echo $startCode$endCode > ./module_route_name.dart


