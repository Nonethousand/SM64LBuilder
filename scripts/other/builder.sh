#Setting the text color
BLUE='\033[0;34m'
echo -e "${BLUE}"
if [ $1 == "9" ]; then
  echo "Select a build to play."
  cd ~/SM64LBuilder/repos
  cd ~/SM64LBuilder/repos/$(zenity --list --column Repos $(ls))/build/us_pc/
  if [ -e sm64.us.f3dex2e ]; then
    ./sm64.us.f3dex2e
  else
    if [ -e sm64.jp.f3dex2e ]; then
      ./sm64.jp.f3dex2e
    else
      if [ -e sm64.eu.f3dex2e ]; then
        ./sm64.eu.f3dex2e
      else
        if [ -e sm64.sh.f3dex2e ]; then
          ./sm64.sh.f3dex2e
        fi
      fi
    fi
  fi
else
if [ $1 == "8" ]; then
  cd ~/SM64LBuilder/repos
  echo "Select a repo to rebuild."
  FOLDER=$(zenity --list --column Repos $(ls))
  make clean
  #Checking for all versions of the baserom
  if [ -e baserom.us.z64 ] || [ -e baserom.jp.z64 ] || [ -e baserom.eu.z64 ] || [ -e baserom.sh.z64 ]; then
    make clean
    IN=$(zenity --list --checklist --title "Build Flags" --text "Flags" --column "" --column "Options" True VERSION=us False VERSION=eu False VERSION=jp False VERSION=sh False TARGET_BITS=32 True TARGET_BITS=64 False TARGET_RPI=1 False TARGET_WEB=1 False WINDOWS_BUILD=1 False OSX_BUILD=1 WINDOWS_CONSOLE=1 DEBUG=1 BETTERCAMERA=1 NODRAWINGDISTANCE=1 TEXTURE_FIX=1 EXT_OPTIONS_MENU=1 EXTERNAL_DATA=1 DISCORDRPC=1 TEXTSAVES=1)
    cd $FOLDER
    make $(echo $IN | tr "|" " ")
  else
    make clean
    echo "Please select your baserom."
   cp $(zenity --file-selection --file-filter='z64 ROMS (z64) | *.z64' --title="Select your z64 ROM") $FOLDER
   IN=$(zenity --list --checklist --title "Build Flags" --text "Flags" --column "" --column "Options" True VERSION=us False VERSION=eu False VERSION=jp False VERSION=sh False TARGET_BITS=32 True TARGET_BITS=64 False TARGET_RPI=1 False TARGET_WEB=1 False WINDOWS_BUILD=1 False OSX_BUILD=1 WINDOWS_CONSOLE=1 DEBUG=1 BETTERCAMERA=1 NODRAWINGDISTANCE=1 TEXTURE_FIX=1 EXT_OPTIONS_MENU=1 EXTERNAL_DATA=1 DISCORDRPC=1 TEXTSAVES=1)
   cd $FOLDER
   make $(echo $IN | tr "|" " ")
  fi
else
if [ $1 == "6" ]; then
  chmod 755 ~/SM64LBuilder/scripts/other/create-new-repo.sh
  bash ~/SM64LBuilder/scripts/other/create-new-repo.sh
else
if [ $1 == "5" ]; then
  git fetch
  git pull
else
if [ $1 == "4" ]; then
  #Confirmation message
echo "ARE YOU SURE YOU WANT TO REMOVE SM64LBUILDER? THIS ACTION CANNOT BE UNDONE. [y/n]"
read answer
if [ $answer == "y" ]; then
echo "Removing SM64LBuilder... Bye..."
cd ~
rm -rf SM64LBuilder
fi
else
if [ $1 == "3" ]; then
cd ~/SM64LBuilder/repos
echo "Select a repo to remove."
DIR=$(zenity --list --column Repos $(ls))
if [ -d $DIR ]; then
rm -rf $DIR
fi
else
  if [ $1 == "7" ]; then
  cd ~/SM64LBuilder/scripts
  echo "Select a script to remove."
  rm $(zenity --list --column Scripts $(ls))
  else
if [ $1 == "2" ]; then
cd ~/SM64LBuilder/repos
LINK=$(zenity --forms --add-entry=Github-Clone-Link)
FOLDER=$(zenity --forms --add-entry=repo-folder-name)
git clone $LINK
 echo "Please select your baserom.us.z64."
cp $(zenity --file-selection --file-filter='z64 ROMS (z64) | *.z64' --title="Select your baserom.us.z64 ROM") $FOLDER
cd $FOLDER
echo "Would you like patches? [y/n]"
read answer
if [ $answer = "y" ]; then
echo "How many?"
read number
for i in {1..$number}; do echo "Chose a file" && git apply $(zenity --file-selection --file-filter='patch files (patch) | *.patch' --title="Select your patch file"); done
fi
echo "Starting compilation of $FOLDER... "
IN=$(zenity --list --checklist --title "Build Flags" --text "Flags" --column "" --column "Options" True VERSION=us False VERSION=eu False VERSION=jp False VERSION=sh False TARGET_BITS=32 True TARGET_BITS=64 False TARGET_RPI=1 False TARGET_WEB=1 False WINDOWS_BUILD=1 False OSX_BUILD=1 WINDOWS_CONSOLE=1 DEBUG=1 BETTERCAMERA=1 NODRAWINGDISTANCE=1 TEXTURE_FIX=1 EXT_OPTIONS_MENU=1 EXTERNAL_DATA=1 DISCORDRPC=1 TEXTSAVES=1)
make $(echo $IN | tr "|" " ")
echo $FOLDER "compiled!"
else
cd ~/SM64LBuilder/scripts
REPO=$(zenity --list --column Repos $(ls -p1 | grep -v / | sed -e 's/\.sh$//'))
/bin/echo -e "You selected $REPO"
if [ -d ~/SM64LBuilder/music-SM64LBuilder ]; then
  mpg123 -q ~/SM64LBuilder/music-SM64LBuilder/MARIO_1A.mp3
  chmod 755 $REPO.sh
bash $REPO.sh &
build_pid=$!
chmod 755 ~/SM64LBuilder/scripts/other/playmusic.sh
bash ~/SM64LBuilder/scripts/other/playmusic.sh &
play_pid=$!
wait $build_pid
kill $play_pid
echo "The music doesn't stop yet so you have to press ctrl+z"
mpg123 -q ~/SM64LBuilder/music-SM64LBuilder/event_star_collect.mp3
else
chmod 755 $REPO.sh
bash $REPO.sh
fi
fi
fi
fi
fi
fi
fi
fi
fi
