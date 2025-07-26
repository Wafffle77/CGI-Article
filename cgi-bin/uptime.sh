#!/bin/bash
echo '<h1>System info</h1>'
echo "<p>System uptime: $(uptime)</p>"
echo '<p>Online users:</p><ul>'

for USER in $(who | cut -f1 -d ' ' | sort | uniq); do
    echo "<li>$USER</li>"
done

echo "</ul>"