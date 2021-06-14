if [ $1 == "--new-script" ]; then
  chmod 755 ~/SM64LBuilder/scripts/create-new-repo.sh
  sh ~/SM64LBuilder/scripts/create-new-repo.sh
else
if [ $1 == "--update" ]; then
cp -r repos ~
BLUE='\033[0;34m'
echo -e "${BLUE}Clone the github again and then run ./builder.sh --replace. First select the repos folder in ~/SM64LBuilder and then select ~/repos\n"
cd ~
rm -rf SM64LBuilder
else
if [ $1 == "--replace" ]; then
echo "Replace what?"
rm -rf $(zenity --file-selection --directory)
echo "What to replace it with?"
cp -r $(zenity --file-selection --directory) ~/SM64LBuilder
else
if [ $1 == "--remove-builder" ]; then
BLUE='\033[0;34m'
echo -e "${BLUE}ARE YOU SURE YOU WANT TO REMOVE SM64LBUILDER? THIS ACTION CANNOT BE UNDONE. [y/n]"
read answer
if [ $answer == "y" ]; then
echo "Removing SM64LBuilder... Bye..."
cd ~
rm -rf SM64LBuilder
fi
else
if [ $1 == "--remove-repo" ]; then
cd ~/SM64LBuilder/repos
if [ -d $2 ]; then
rm -rf $2
else
echo $2 "is not a directory!"
fi
else
if [ $1 == "--help" ]; then
printf "Commands: --help = see this help message\n --library = see the built in repos\n --custom-repo = build with a custom repo\n --remove-builder = remove SM64LBuilder\n --remove-repo = remove a repo\n --jobs = build with jobs\n --update = get instructions on how to update\n --replace = replace 2 folders\n --new-script = make a built in repo to build"
else
if [ $1 == "--custom-repo" ]; then
cd repos
git clone $2
 echo "Please select your baserom.us.z64."
cp $(zenity --file-selection --file-filter='z64 ROMS (z64) | *.z64' --title="Select your baserom.us.z64 ROM") $3
cd $3
echo "Would you like patches? [y/n]"
read answer
if [ $answer = "y" ]; then
echo "How many?"
read number
for i in {1..$number}; do echo "Chose a file" && git apply $(zenity --file-selection --file-filter='patch files (patch) | *.patch' --title="Select your patch file"); done
fi
echo "Starting compilation of $3... "
IN=$(zenity --list --checklist --title "Build Flags" --text "Flags" --column "" --column "Options" True VERSION=us False VERSION=eu False VERSION=jp False VERSION=sh False TARGET_BITS=32 True TARGET_BITS=64 False TARGET_RPI=1 False TARGET_WEB=1 False WINDOWS_BUILD=1 False OSX_BUILD=1 WINDOWS_CONSOLE=1 DEBUG=1 BETTERCAMERA=1 NODRAWINGDISTANCE=1 TEXTURE_FIX=1 EXT_OPTIONS_MENU=1 EXTERNAL_DATA=1 DISCORDRPC=1 TEXTSAVES=1)
if [ $4 == "--jobs" ]; then
make $(echo $IN | tr "|" " ") $5
else
make $(echo $IN | tr "|" " ")
fi
echo $3 "compiled!"
else
REPO=$(zenity --list --column Repos sm64ex sm64ex-coop sm64ex-alo sm64 render96ex moon64)
echo -e "You selected $REPO"
cd ~/SM64LBuilder/scripts
  chmod 755 $REPO.sh
  if [ $1 == "--jobs" ]; then
  sh $REPO.sh $1 $2
  else
  sh $REPO.sh
  fi
fi
fi
fi
fi
fi
fi
fi
