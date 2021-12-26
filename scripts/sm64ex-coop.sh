cd ~/SM64LBuilder/repos
echo "Cloning sm64ex-coop..."
git clone https://github.com/djoslin0/sm64ex-coop.git
echo "Please select your baserom."
if [ -e ~/SM64LBuilder/.variables/.baserompath ]; then
  cp $(cat ~/SM64LBuilder/.variables/.baserompath) sm64ex-coop
else
cp $(zenity --file-selection --file-filter='z64 ROMS (z64) | *.z64' --title="Select your z64 ROM") sm64ex-coop
fi
cd sm64ex-coop
echo "Would you like patches? [y/n]"
read answer < /dev/tty
if [ $answer == "y" ]; then
echo "How many?"
read number < /dev/tty
for i in $( eval echo {0..$number} )
do
  echo "Choose a file"
  git apply $(zenity --file-selection --file-filter='patch files (patch) | *.patch' --title="Select your patch file")
done
fi
echo "Starting compilation of sm64ex-coop..."
IN=$(zenity --list --checklist --title "Build Flags" --text "Flags" --column "" --column "Options" True VERSION=us False VERSION=eu False VERSION=jp False VERSION=sh False TARGET_BITS=32 True TARGET_BITS=64 False TARGET_RPI=1 False TARGET_WEB=1 False WINDOWS_BUILD=1 False OSX_BUILD=1 WINDOWS_CONSOLE=1 DEBUG=1 BETTERCAMERA=1 NODRAWINGDISTANCE=1 TEXTURE_FIX=1 EXT_OPTIONS_MENU=1 EXTERNAL_DATA=1 DISCORDRPC=1 TEXTSAVES=1)
if [ $1 == "--jobs" ]; then
make $(echo $IN | tr "|" " ") $2
else
make $(echo $IN | tr "|" " ")
fi
echo "sm64ex-coop compiled!"




#Maybe you should play sm64js lol
