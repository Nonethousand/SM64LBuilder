if [ -e ~/SM64LBuilder/repos/temp ]; then
rm ~/SM64LBuilder/repos/temp
fi
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
echo "Commands: --help = see this help message, --library = see the built in repos, --custom-repo = build with a custom repo, --remove-builder = remove SM64LBuilder, --remove-repo = remove a repo"
else
if [ $1 == "--library" ]; then
cd ~/SM64LBuilder/scripts
ls
cd ~/SM64LBuilder
else
if [ $1 == "--custom-repo" ]; then
cd repos
git clone $2
  if [ -e ~/baserom.us.z64 ]; then
  cp ~/baserom.us.z64 $3
  cd $3
  echo "Would you like patches? [y/n]"
  read answer
    if [ $answer = "y" ]; then
    echo "How many?"
    read number
    for i in {1..$number}; do echo "Enter your patch location" && read location && git apply $location; done
    fi
  echo "Starting compilation of $3... (build flags are not available right now.) "
 if [ $1 -- "--jobs" ]; then
make $2
else
make
fi
  echo $3 "compiled!"
  else
  cd ~/SM64LBuilder/repos
  rm $3
  echo "baserom.us.z64 not found in home directory. Please put your baserom into your home directory."
  fi
else
cd scripts
  if [ -e $1.sh ]; then
  echo $1 "found! Cloning the repo..."
  chmod 755 $1.sh
  if [ $2 == "--jobs" ]; then
  sh $1.sh $2 $3
  else
  sh $1.sh
  fin
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
