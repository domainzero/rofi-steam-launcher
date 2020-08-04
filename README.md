# rofi-steam-launcher
Create a dynamic Steam launcher for `rofi` using [rofigen](https://github.com/losoliveirasilva/rofigen)  
  
Run the script to generate a menu file, then call it with `rofigen /path/to/file`  
Install a new game? Rerun the script to update your menu!

![](https://raw.githubusercontent.com/domainzero/rofi-steam-launcher/master/media/example.gif)

## Requirements
- `rofi`
- `rofigen`

## Installation and use  
1. Either clone the repo or copy the script manually.
2. Fill in and/or correct the variables in the top section of the script, ensuring the path to your Steam installation is correct. Optionally, change the output directory from `~/.local/bin` to a directory of your choosing.
3. Make it executable with `chmod +x generate-menu.sh`
4. Run it via `./generate-menu.sh` !
5. Set up a bash alias or bind a key via your WM to open the menu.
