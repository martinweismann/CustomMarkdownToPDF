#!/bin/bash

FILE="$1"
TMPFILE="temp.html"

grip "$FILE.md" --export "$FILE.html" --user=martin.weismann --pass="$GITHUB_API_KEY"
sed "s|readme boxed-group clearfix announce instapaper_body md||g" "$FILE.html" > "$TMPFILE"
sed -i "s|.md$||g" "$TMPFILE"
sed -i 's|<a href="images/3mf_logo_50px.png"|<a|g' "$TMPFILE"

sed -i 's|<a href="#|<a href="@|g' "$TMPFILE"
sed -i 's|href="#|name="|g' "$TMPFILE"
sed -i 's|<a href="@|<a href="#|g' "$TMPFILE"

MARGIN=14

./wkhtmltopdf --title "$FILE" --footer-left "[section]" --footer-right "[page]/[topage]" --footer-font-size 7 --footer-spacing 2 \
--margin-top $MARGIN --margin-left $MARGIN --margin-right $MARGIN --margin-bottom $MARGIN \
--zoom 1.2 --image-dpi 720 \
"$TMPFILE" "$FILE.pdf"
