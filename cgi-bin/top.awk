#!/bin/awk -f

BEGIN {
    FS=" "
    OFS="</td><td>"
    TOP="top -bn1 -w512"

    for(i = 0; i < 6; i++) TOP |& getline
    
    print "<meta http-equiv=Refresh content=3 /><style>table,tbody,td { border: 1px solid black; }</style>"
    print "<table><thead>"
    TOP |& getline
    $1=$1
    printf "<tr><td>"
    print
    printf "</td></tr>"

    
    print "</thead><tbody>"

    while(TOP |& getline) {
        $1=$1
        printf "<tr><td>"
        print
        printf "</td></tr>"
    }

    print "</tbody></table>"
}