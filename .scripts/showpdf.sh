#!/bin/sh

name=$(echo $1 | sed "s/\..*//")
zathura $name.pdf
