#!/bin/bash

TITLE="$(cut -d/ -f2 <<<"$PATH_INFO")"

if [ -z "$TITLE" ]; then
    echo '<h1>Please provide a title to look for!</h1>'
    exit
fi

ENTRY="$(grep -m1 -F ":$TITLE" enwiki-20250501-pages-articles-multistream-index.txt)"
OFFSET="$(cut -d: -f1 <<<"$ENTRY")"
ID="$(cut -d: -f2 <<<"$ENTRY")"
# TITLE="$(cut -d: -f3- <<<"$ENTRY")"

if [ -z "$OFFSET" ]; then
    echo "<h1>Can't find '$TITLE'!</h1>"
    exit
fi

dd if=enwiki-20250501-pages-articles-multistream.xml.bz2 bs=1 skip="$OFFSET" | bzip2 -dc | awk "/<id>$ID<\/id>/ {FOUND=1} FOUND && /<text/ {PRINT=1} PRINT {print} PRINT && /<\/text>/ {exit}" | xq -r '.text["#text"]' | pandoc -f mediawiki -t html