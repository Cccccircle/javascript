#!/bin/bash                                                                                    
file_path=$1                                                                                   
files=$(ls $file_path)                                                                         
for file in $files                                                                             
do                                                                                             
    if [[ $(echo $file | grep -E 'own_') != "" ]];then                                         
        echo  "已 经 初 始 化 完 成 ,不 需 要 重 复 执 行 !"                                                 
        exit 0                                                                                 
    fi                                                                                         
    temp_file=$(echo $file | grep -E 'jd_|jx_')                                                
    if [[ "$temp_file" != "" ]];then                                                           
        file_name='own_'$file                                                                  
        mv "$file_path/$file" "$file_path/$file_name"                                          
        if [[ $? = 0 ]];then                                                                   
            echo "${file}文 件 重 命 名 完 成 !"                                                      
        else                                                                                   
            echo "重 命 名 发 生 错 误 "                                                              
        fi                                                                                     
    fi                                                                                         
done                                                                                           
exit 0
