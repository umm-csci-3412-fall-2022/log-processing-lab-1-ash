#!/bin/bash
cat "$2"_header.html "$1" "$2"_footer.html > "$3"

[ "$4" = "view" ] && firefox "$3"
