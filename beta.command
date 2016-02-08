#!/bin/bash
environment=beta
parent_path=$( cd "$(dirname "${BASH_SOURCE}")" ; pwd -P )
local_maven="$parent_path/app/$environment/.m2/repository"
cd "$parent_path/app"
# Revert any previously advanced dependency version property to start fresh
# This is necessary to make sure pom dependency versions don't get ahead of
# the lastest available. Otherwise, property doesn't reflect actual version.
# Actual version is need to be passed as a java argument.
./mvnw -U -P"$environment" -Denv="$environment" -Dmaven.repo.local="$local_maven" versions:revert
# Update to latest version (if changed)
./mvnw -U -P"$environment" -Denv="$environment" -Dmaven.repo.local="$local_maven" versions:update-properties
# Run latest version
./mvnw -U -P"$environment" -Denv="$environment" -Dmaven.repo.local="$local_maven" exec:exec
