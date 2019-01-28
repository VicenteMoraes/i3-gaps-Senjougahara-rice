#!/bin/sh


chosen=$(ls ~/Templates | rofi -dmenu -i -p Templates)
ext=${chosen,,}
template=$( ((ls ~/Templates/$chosen) | grep .$ext)  | rofi -dmenu -i -p Templates)
name=$(rofi -dmenu -p Rename).$ext
cp ~/Templates/$chosen/$template $name
vim $name
