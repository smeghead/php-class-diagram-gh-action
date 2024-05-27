#!/bin/sh -l

target_path=$1
output_path=$2
options=$3

php-class-diagram $options ${GITHUB_WORKSPACE}/$target_path | plantuml -pipe -tpng > ${GITHUB_WORKSPACE}/${output_path}
