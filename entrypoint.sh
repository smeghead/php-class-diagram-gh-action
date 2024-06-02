#!/bin/sh -l

target_path=$1
output_path=$2
options=$3
target_repo=$4
target_branch=$5

format=png
if echo $output_path | grep -q ".svg"; then
	options="$options --svg-topurl=https://github.com/$target_repo/blob/$target_branch/$target_path"
	format=svg
fi

echo php-class-diagram $options ${GITHUB_WORKSPACE}/$target_path >&2
php-class-diagram $options ${GITHUB_WORKSPACE}/$target_path | plantuml -pipe -t${format} > ${GITHUB_WORKSPACE}/${output_path}
