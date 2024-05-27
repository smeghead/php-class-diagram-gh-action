#!/bin/sh -l

src=$1
output_path=$2
options=$3

php-class-diagram $options ${GITHUB_WORKSPACE}/$src | plantuml -pipe -tpng > ${GITHUB_WORKSPACE}/${output_path}

time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT
