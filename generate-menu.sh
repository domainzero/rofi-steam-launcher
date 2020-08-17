#!/bin/bash
# VARIABLE SETUP
LIBRARY=~/.steam/steam/
OUTPUT_LOC="/home/$USER/.local/bin/game-menu"

build_csv () {
	grep -n "name" "$LIBRARY"/steamapps/*.acf | \
	sed -e 's/^.*_//;s/\.acf:.:/ /;s/name//;s/"//g;s/\t//g;s/ /,/' | \
        grep -vE '(Proton|Steamworks|The Ship)'
}

# Build out the first part of the menu file - this is static
if test -f "$OUTPUT_LOC"; then
	echo "$OUTPUT_LOC" already exists. Rebuilding games list.
	sed -i '10,1000d' $OUTPUT_LOC 
	while IFS=, read -r field1 field2; do
		echo -e "\t[$field2]='/usr/bin/steam steam://rungameid/$field1'"
	done <<< "$(build_csv)" >> $OUTPUT_LOC
	echo -e ")" >> $OUTPUT_LOC
else
	echo "$OUTPUT_LOC" not present. Building whole file.
	echo -e "#!/bin/bash\n\ntitle='Games Launcher'\nwidthpercent=100%\n\ntypeset -A menu\nmenu=(" > $OUTPUT_LOC
	while IFS=, read -r field1 field2; do
		echo -e "\t[$field2]='/usr/bin/steam steam://rungameid/$field1'"
	done <<< "$(build_csv)" >> $OUTPUT_LOC
	echo -e ")" >> $OUTPUT_LOC
fi

# wipe out any existing games in the game menu already
# this starts at line 10 for me because I have a few games I launch via Lutris in addition to Steam
# read in the comma seperated values, then spit each game in a formatted line
# stick in the closing parentheses
# done!
echo "Now launch via rofigen! rofigen ~/.local/bin/game-menu"
