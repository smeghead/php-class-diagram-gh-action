#!/bin/sh -l

target_path=$1
output_path=$2
options=$3

repo=$GITHUB_ACTION_REPOSITORY
branch=$GITHUB_REF_NAME

format=png
if [[ $output_path == *.svg ]]; then
	options="$options --svg-topurl=https://github.com/$repo/blob/$target_path"
	format=svg
fi

php-class-diagram $options ${GITHUB_WORKSPACE}/$target_path | plantuml -pipe -t${format} > ${GITHUB_WORKSPACE}/${output_path}
