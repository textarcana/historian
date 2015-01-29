#!/usr/bin/env bash

SVN_LOG=tests/data/xml/svn-log.xml
STATSVN_FILE=tests/data/xml/statsvn-data/cache_4cfb86a4-2c7a-11df-bd14-c1e331e6ceac.xml
STATSVN_HTML_DIR=tests/data/www/statsvn-www

bin/statsvn_html/paths_changed $STATSVN_HTML_DIR
bin/statsvn_html/commits_per_author $STATSVN_HTML_DIR > /dev/null &

bin/svn/authors_by_hour_of_day $SVN_LOG > /dev/null &

bin/statsvn/insertions_subtracted_from_deletions_per_commit $STATSVN_FILE > /dev/null &
bin/statsvn/insertions_plus_deletions_per_commit $STATSVN_FILE > /dev/null &
bin/statsvn/total_insertions $STATSVN_FILE > /dev/null &
bin/statsvn/total_deletions $STATSVN_FILE > /dev/null &
bin/statsvn/total_commits $STATSVN_FILE > /dev/null &
bin/statsvn/paths_changed_in_the_largest_commit $STATSVN_FILE > /dev/null &
bin/statsvn/unique_paths_per_commit $STATSVN_FILE > /dev/null &
