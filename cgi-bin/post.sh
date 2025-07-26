#!/bin/bash

decode_url() {
    tr + ' ' | while CHAR="$(head -c1)" && test -n "$CHAR"; do
        test % = "$CHAR" && echo -ne "\x$(head -c2)" || printf '%c' "$CHAR"
    done
}

if [ "$REQUEST_METHOD" = "POST" ]; then
    (
        echo "$REMOTE_ADDR @ $(date)"
        echo -n '> '
        grep --text -oP '(?<=content=)[^&\n]+' | decode_url
        echo
    ) >> post.txt
fi

if [ -f post.txt ]; then
    echo '<pre>'
    cat post.txt
    echo '</pre>'
fi

cat <<"EOF"
<form method="POST">
<input type="text" name="content"></textarea>
<input type="submit" value="Submit">
</form>
EOF