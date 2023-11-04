#!/bin/bash

# script to run POLARIS tests on CI

set -e -x

POLARIS_BINARY=${1:-polaris} #command to run polaris, default: polaris
PROJECTS_PATH=${2:-projects} #location of projects folder, default: projects

# set paths in cmd files
sed -i.bak 's|/PATH/TO/POLARIS|'`pwd`'|' ${PROJECTS_PATH}/CommandList.cmd
sed -i.bak 's|/YOUR/POLARIS/PATH|'`pwd`'|' ${PROJECTS_PATH}/disk/example/temp/POLARIS.cmd

${POLARIS_BINARY} ${PROJECTS_PATH}/disk/example/temp/POLARIS.cmd # run disk temp example

ls ${PROJECTS_PATH}/disk/example/temp/*/* # a list of generated outputs
