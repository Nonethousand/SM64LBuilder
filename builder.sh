if [ -e ~/SM64LBuilder/repos/temp ]; then
rm ~/SM64LBuilder/repos/temp
fi
if [ $1 == "--update" ]; then
cp -r repos ~
BLUE='\033[0;34m'
echo -e "${BLUE}Clone the github again, remove the repos folder inside the new SM64LBuilder folder, and then move ~/repos to ~/SM64LBuilder"
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
echo "Commands: --help = see this help message, --library = see the built in repos, --custom-repo = build with a custom repo, --remove-builder = remove SM64LBuilder, --remove-repo = remove a repo, --jobs = build with jobs, --update = get instructions on how to update"
else
if [ $1 == "--library" ]; then
cd ~/SM64LBuilder/scripts
ls
cd ~/SM64LBuilder
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
if [ $1 == "--jobs" ]; then
make $(zenity --forms --title="Build Flags" --add-entry=Flags) $2
else
make $(zenity --forms --title="Build Flags" --add-entry=Flags)
fi
echo $3 "compiled!"
else
cd scripts
  if [ -e $1.sh ]; then
  echo $1 "found! Cloning the repo..."
  chmod 755 $1.sh
  if [ $2 == "--jobs" ]; then
  sh $1.sh $2 $3
  else
  sh $1.sh
  fi
  else
    if [ $1 == "" ]; then
    echo "No arguments specified. Run --help to see avialable arguments"
    else
    echo $1 "not found!"
fi
fi
fi
fi
fi
fi
fi
fi
fi
