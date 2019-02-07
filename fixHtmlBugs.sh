#!/bin/bash

FILE=$1
TMPFILE=$2

sed "s|readme boxed-group clearfix announce instapaper_body md||g" $FILE > $TMPFILE
sed -i "s|.md$||g" $TMPFILE
sed -i 's|<a href="images/3mf_logo_50px.png"|<a|g' $TMPFILE

sed -i 's|<a href="#|<a href="@|g' $TMPFILE
sed -i 's|href="#|name="|g' $TMPFILE
sed -i 's|<a href="@|<a href="#|g' $TMPFILE
