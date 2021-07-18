#!/bin/bash

if [ -e ./.variables/.created_alias ]; then
  echo
else
  if [ $1 == "--no-alias" ]; then
    echo
  else
  SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
echo -e "alias SM64LBuilder='. $DIR/main.sh'" >> ~/.bashrc
echo "" >> ./.variables/.created_alias
fi
fi

if [ -e ./.variables/.dev_mode ]; then
  #Dev mode, mainly for me
  HEIGHT=21
  WIDTH=40
  CHOICE_HEIGHT=14
  BACKTITLE="SM64LBuilder"
  TITLE="What to do?"
  MENU="No, this is not a clone of smlinux"

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
           13 "Report bug"
           14 "Exit")


           CHOICE=$(dialog --clear \
                           --backtitle "$BACKTITLE" \
                           --title "$TITLE" \
                           --menu "$MENU" \
                           $HEIGHT $WIDTH $CHOICE_HEIGHT \
                           "${OPTIONS[@]}" \
                           2>&1 >/dev/tty)

                           clear
                           chmod 755 ./scripts/other/builder.sh
                           cd scripts
                           if [ $CHOICE == "11" ]; then
                             cd ../.variables
                             REMOVE=$(zenity --list --column variables $(ls -A))
                             cd ../scripts
                             if [ $REMOVE == "temp" ]; then
                             echo "You can't remove that!"
                           else
                             rm $REMOVE
                           fi
                           else
                             if [ $CHOICE == "10" ]; then
                               rm ./.variables/.dev_mode
                               cd ..
                               ./main.sh
                               cd scripts
                             else
                               if [ $CHOICE == "14" ]; then
                                 echo "Goodbye!"
                                 exit
                               else
                                 if [ $CHOICE == "12" ]; then
                                   rm ./.variables/.created_alias
                                   rm ./.variables/.dev_mode
                                   rm ./.variables/.baserompath
                                   rm -rf ./music-SM64LBuilder
                                 else
                                   if [ $CHOICE == "13" ]; then
                                     xdg-open https://github.com/HiImBlahh/SM64LBuilder/issues/new?assignees=\&labels=bug\&template=bug_report.md\&title=
                                   else
                           ./other/builder.sh $CHOICE
                         fi
                         fi
                             fi
                           fi
                         fi
else
HEIGHT=20
WIDTH=40
CHOICE_HEIGHT=13
BACKTITLE="SM64LBuilder"
TITLE="What to do?"
MENU="No, this is not a clone of smlinux"

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
         12 "Report bug"
         13 "Exit")


CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
chmod 755 ./scripts/other/builder.sh
cd scripts/other/
if [ $CHOICE == "13" ]; then
  echo "Goodbye!"
  exit
else
  if [ $CHOICE == "10" ]; then
    echo "" >> ./.variables/.dev_mode
    cd ../..
    ./main.sh
    cd scripts/other
  else
    if [ $CHOICE == "12" ]; then
      xdg-open https://github.com/HiImBlahh/SM64LBuilder/issues/new?assignees=\&labels=bug\&template=bug_report.md\&title=
    else
    if [ $CHOICE == "11" ]; then
      HEIGHT=9
      WIDTH=40
      CHOICE_HEIGHT=2
      BACKTITLE="SM64LBuilder"
      TITLE="What to do?"
      MENU="No, this is not a clone of smlinux"

      OPTIONS=(1 "Set a baserom path"
               2 "Install optional music and sfx")


      CHOICE=$(dialog --clear \
                      --backtitle "$BACKTITLE" \
                      --title "$TITLE" \
                      --menu "$MENU" \
                      $HEIGHT $WIDTH $CHOICE_HEIGHT \
                      "${OPTIONS[@]}" \
                      2>&1 >/dev/tty)

      clear
      if [ $CHOICE == "1" ]; then
        echo $(zenity --file-selection --file-filter='z64 ROMS (z64) | *.z64' --title="Select your z64 ROM") >> ./.variables/.baserompath
      else
        if [ $CHOICE == "2" ]; then
          cd ../..
          git clone https://github.com/HiImBlahh/music-SM64LBuilder.git
          cd scripts/other
        fi
      fi
      else
./builder.sh $CHOICE
fi
fi
fi
fi
fi
cd



#It is 9:59 P.M. when typing this comment
