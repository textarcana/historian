# Historian

## A sophisticated SCM interface

## Tests

The test data is from the TortoiseSVN project [SVN repo](https://code.google.com/p/tortoisesvn/source/checkout).

Test data collection looked something like this:

    svn log -v --xml -r {`date -d "28 days ago" +%Y-%m-%d`}:HEAD . > "svn-log.xml"

    java -Djava.awt.headless=true -jar ~/svn-historian/vendor/statsvn-0.7.0/statsvn.jar \
         -css ~/svn-historian/vendor/statsvn-0.7.0/statsvn.css \
         -cache-dir "statsvn-data" \
         -threads 200 \
         -disable-twitter-button -output-dir "statsvn-www"  \
         -exclude "(ext|Languages|src/TortoiseProc/LogDialog)/*" \
         "/Users/nsussman/svn-historian/tests/data/xml/svn-log.xml" .
