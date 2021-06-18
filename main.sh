#!/bin/bash

if [ -e ~/SM64LBuilder/.variables/.created_alias ]; then
  echo
else
cd
echo -e "alias SM64LBuilder='. ~/SM64LBuilder/main.sh'" >> .bash_aliases
echo "" >> ~/SM64LBuilder/.variables/.created_alias
cd ~/SM64LBuilder
fi

if [ -e ~/SM64LBuilder/.variables/.dev_mode ]; then
  #Dev mode, mainly for me
  HEIGHT=20
  WIDTH=40
  CHOICE_HEIGHT=13
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
           10 "Disable dev mode"
           11 "Remove variables"
           12 "Delete files for git commits"
           13 "Exit")


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
                           if [ $CHOICE == "11" ]; then
                             cd ~/SM64LBuilder/.variables
                             REMOVE=$(zenity --list --column variables $(ls -A))
                             if [ $REMOVE == "temp" ]; then
                             echo "You can't remove that!"
                           else
                             rm $REMOVE
                           fi
                           else
                             if [ $CHOICE == "10" ]; then
                               rm ~/SM64LBuilder/.variables/.dev_mode
                               cd ~/SM64LBuilder
                               ./main.sh
                             else
                               if [ $CHOICE == "13" ]; then
                                 echo "Goodbye!"
                               else
                                 if [ $CHOICE == "12" ]; then
                                   rm ~/SM64LBuilder/.variables/.created_alias
                                   rm ~/SM64LBuilder/.variables/.dev_mode
                                   rm ~/SM64LBuilder/.variables/.baserompath
                                 else
                           ./builder.sh $CHOICE
                         fi
                         fi
                             fi
                           fi
else
HEIGHT=19
WIDTH=40
CHOICE_HEIGHT=12
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
         10 "Enable dev mode"
         11 "Misc Options"
         12 "Exit")


CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
chmod 755 ~/SM64LBuilder/scripts/other/builder.sh
cd ~/SM64LBuilder/scripts/other
if [ $CHOICE == "12" ]; then
  echo "Goodbye!"
else
  if [ $CHOICE == "10" ]; then
    echo "" >> ~/SM64LBuilder/.variables/.dev_mode
    cd ~/SM64LBuilder
    ./main.sh
  else
    if [ $CHOICE == "11" ]; then
      HEIGHT=9
      WIDTH=40
      CHOICE_HEIGHT=2
      BACKTITLE="SM64LBuilder"
      TITLE="What to do?"
      MENU="Choose one of the following options:"

      OPTIONS=(1 "Set a baserom path")


      CHOICE=$(dialog --clear \
                      --backtitle "$BACKTITLE" \
                      --title "$TITLE" \
                      --menu "$MENU" \
                      $HEIGHT $WIDTH $CHOICE_HEIGHT \
                      "${OPTIONS[@]}" \
                      2>&1 >/dev/tty)

      clear
      if [ $CHOICE == "1" ]; then
        echo $(zenity --file-selection --file-filter='z64 ROMS (z64) | *.z64' --title="Select your z64 ROM") >> ~/SM64LBuilder/.variables/.baserompath
      else
        echo
      fi
    else
./builder.sh $CHOICE
fi
fi
fi
fi
cd



#It is 9:59 P.M. when typing this comment
