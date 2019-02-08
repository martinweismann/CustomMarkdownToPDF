#!/bin/bash

wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
tar vxf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
cp wkhtmltox/bin/wkhtmltopdf .
chmod a+x wkhtmltopdf
