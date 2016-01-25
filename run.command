#!/bin/bash
parent_path=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )

cd "$parent_path/app"
./mvnw -U -Dmaven.repo.local="$parent_path/app/.m2/repository" versions:use-latest-releases exec:exec
