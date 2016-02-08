#!/bin/bash
environment=critical
parent_path=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )
cd "$parent_path/app"
./mvnw -U -P"$environment" -Denv="$environment" -Dmaven.repo.local="$parent_path/app/$environment/.m2/repository" versions:use-latest-releases exec:exec
