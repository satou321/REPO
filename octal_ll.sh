#!/bin/bash

file="./$1"
source ./s2o.sh
octal_ll(){
    while read -r perm user group
    do
        octal_perm=$(symbolic2octal <<< "${perm}")
        echo -e "${octal_perm}\t${user}\t${group}"
    done < "$file"
}