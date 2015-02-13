#!/usr/bin/env bash

which lynx > /dev/null
which jq > /dev/null
which xmlstarlet > /dev/null

LARGE_SVN_LOG=tests/data/xml/svn-log-1000.xml
SVN_LOG=tests/data/xml/svn-log.xml
STATSVN_FILE=tests/data/xml/statsvn-data/cache_4cfb86a4-2c7a-11df-bd14-c1e331e6ceac.xml
STATSVN_HTML_DIR=tests/data/www/statsvn-www

test -f $SVN_LOG
test -f $STATSVN_FILE
test -d $STATSVN_HTML_DIR

bin/svn/testers $SVN_LOG | jq -s . > /dev/null &

bin/svn/impact $SVN_LOG | jq -s . > /dev/null &

bin/svn/authors $SVN_LOG | jq -s . > /dev/null &

bin/svn/branches $LARGE_SVN_LOG | jq -s . > /dev/null &
bin/svn/top_level_paths $SVN_LOG | jq -s . > /dev/null &
bin/svn/path_affinity $SVN_LOG | jq -s . > /dev/null &

bin/svn/popular_paths $SVN_LOG | jq -s . > /dev/null &
bin/svn/authors_by_paths_touched $SVN_LOG | jq -s . > /dev/null &
bin/svn/log_analytics $SVN_LOG | jq -s . > /dev/null &

bin/statsvn_html/paths_changed $STATSVN_HTML_DIR | jq -s . > /dev/null &
bin/statsvn_html/commits_per_author $STATSVN_HTML_DIR | jq -s . > /dev/null &

bin/svn/authors_by_hour_of_day $SVN_LOG | jq -s . > /dev/null &

bin/statsvn/insertions_subtracted_from_deletions_per_commit $STATSVN_FILE | jq -s . > /dev/null &
bin/statsvn/insertions_plus_deletions_per_commit $STATSVN_FILE | jq -s . > /dev/null &
bin/statsvn/total_insertions $STATSVN_FILE | jq -s . > /dev/null &
bin/statsvn/total_deletions $STATSVN_FILE | jq -s . > /dev/null &
bin/statsvn/total_commits $STATSVN_FILE | jq -s . > /dev/null &
bin/statsvn/paths_changed_in_the_largest_commit $STATSVN_FILE | jq -s . > /dev/null &
bin/statsvn/unique_paths_per_commit $STATSVN_FILE | jq -s . > /dev/null &
