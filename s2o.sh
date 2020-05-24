#!/bin/bash

# パーミッション情報をchmodで使える8進数で保存
#mode=$(
symbolic2octal(){
        local symbolic_file="$1"
        local perms
        perms=$(
                awk '{print substr($1,2,9);}' "$symbolic_file"|                                    # パーミッション文字列抽出
                sed 's/..\(.\)..\(.\)..\(.\)/\2\2\3 &/' |                      # 3者の実行ビット文字を手前にコピー
                awk '{gsub(/[x-]/,"0",$1);gsub(/[^0]/,"1",$1);print $1 $2;}' | # 実行ビットが"-","x"以外ならビット立て
                tr 'STrwxst-' '00111110' |                                     # 残りは小文字ならビット立て
                xargs printf 'ibase=2;%s\n' |                                  # 得られた文字列を2進数と見なし……
                bc |                                                           # ……一旦10進数に変換
                xargs  printf '%04o\n'                                         # 8進数化（4桁にゼロパディングしつつ）
        ) 
        echo "$perms"
}
