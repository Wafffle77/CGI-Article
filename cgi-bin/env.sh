#!/bin/bash

echo '<style>table,tbody,td { border: 1px solid black; }</style>'
echo '<table><tbody>'
printenv | sed -e 's|^|<tr><td>|' -e 's|=|</td><td>|' -e 's|$|</td></tr>|'
echo '</tbody></table>'