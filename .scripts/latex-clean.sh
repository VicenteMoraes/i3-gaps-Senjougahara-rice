#!/bin/sh

arg=${1%.*}
exts="aux bbl blg brf idx ilg ind lof log lol lot out toc synctex.gz xml bcf fdb fls run.xml fdb_latexmk"

if [ -d $arg ]; then
    for ext in $exts; do
         rm -f $arg/*.$ext
    done
else
    for ext in $exts; do
         rm -f $arg.$ext
    done
fi



#Source: https://gist.github.com/dougalsutherland/266983/9c88f1ca1cf1420af03166dcfccb9cb10a21c110
