#!/bin/bash

# shellcheck source=grep_search.sh
source "./grep_search.sh"
expect=$1
actual_file_name="$2"


if [[ $# -ne 2 ]] ;then
	echo "引数が違います。想定：2　現在：$#"
	exit
fi

for server in $actual_file_name
do
echo $server
	result=$(grep_search "$expect" "$server")
	printf '### %s ###\n %s \n' "${server}" "${result}"
done