#!/usr/bin/env bash

FILE=tests/data/xml/statsvn-data/cache_4cfb86a4-2c7a-11df-bd14-c1e331e6ceac.xml


bin/statsvn/insertions_subtracted_from_deletions_per_commit $FILE
bin/statsvn/insertions_plus_deletions_per_commit $FILE
bin/statsvn/total_insertions $FILE
bin/statsvn/total_deletions $FILE
bin/statsvn/total_commits $FILE
bin/statsvn/paths_changed_in_the_largest_commit $FILE
bin/statsvn/unique_paths_per_commit $FILE
