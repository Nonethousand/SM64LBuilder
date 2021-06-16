#!/bin/bash

cd
echo -e "alias SM64LBuilder='. ~/SM64LBuilder/main.sh'" > .bash_aliases
cd ~/SM64LBuilder

HEIGHT=17
WIDTH=40
CHOICE_HEIGHT=10
BACKTITLE="SM64LBuilder"
TITLE="What to do?"
MENU="Choose one of the following options:"

OPTIONS=(1 "Build"
         2 "Build with a custom repo"
         3 "Remove a repo"
         4 "Remove SM64LBuilder"
         5 "Update SM64LBuilder"
         6 "Create a new built in repo"
         7 "Remove a script"
         8 "Rebuild a repo"
         9 "Run a game"
         10 "Exit")


CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
chmod 755 ~/SM64LBuilder/scripts/builder.sh
cd ~/SM64LBuilder/scripts
if [ $CHOICE == "10" ]; then
  echo "Goodbye!"
else
./builder.sh $CHOICE
fi
echo "Tip: You can run this builder again by running SM64LBuilder in the terminal."
cd
