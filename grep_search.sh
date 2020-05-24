#!/bin/bash
# shellcheck source=octal_ll.sh
#########
#
# Usage:grep_search "$expect_folder_file" "$actual_folder_file"
#
########
source "./octal_ll.sh"

expect="$1"
server="$2"
ll=$(octal_ll "$expect")
function grep_search(){
    while IFS=$'\t' read -r line
    do
        #echo "######## $line ######"
        #printf 'expect_file_name:%s\n actual_file_name:%s\n' "${expect}" "${actual}"
        #sdiff <(echo "$line") "$server"
        grep -xqs "${line}" "$server" \
        && echo "o ${line}" \
        || echo "x ${line} ★　Not found exact match"
    done < <(echo "$ll")
}