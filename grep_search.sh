#!/bin/bash
# shellcheck source=octal_ll.sh
source "./octal_ll.sh"

expect="$1"
server="$2"
ll=$(octal_ll "$expect")
function grep_search(){
    while IFS=$'\t' read -r line
    do
        #echo "$line"
        #printf 'expect_file_name:%s\n actual_file_name:%s\n' "${expect}" "${actual}"
        #sdiff <(echo "$line") "$server"
        grep -xqs "${line}" "$server" \
        && echo "○ ${line}" \
        || echo "☓ ${line} ★　完全一致するパスはありません"
    done < <(echo "$ll")
}