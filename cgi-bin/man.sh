#!/bin/bash

set -o pipefail

echo '<meta charset=utf8>'

if [ -z "$PATH_INFO" ]; then
    echo '<h1>Please enter a man page to navigate to</h1>'
fi

SECTION="$(cut -d/ -f2 <<<"$PATH_INFO")"
NAME="$(cut -d/ -f3 <<<"$PATH_INFO")"

(
    set -e
    if [ -n "$NAME" ]; then
        man --recode utf8 "$SECTION" "$NAME"
    else
        man --recode utf8 "$SECTION"
    fi
) | pandoc -f man -t html || echo -e '<h1>Man page not found!</h1>'