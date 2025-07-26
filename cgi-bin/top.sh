#!/bin/bash

echo '<meta http-equiv="Refresh" content="3" />'
echo '<pre>'
top -bn1 -w512 $QUERY_STRING
echo '</pre>'