cd ~/SM64LBuilder/repos
git clone https://github.com/sm64pc/sm64ex.git
echo "Please select your baserom"
cp $(zenity --file-selection --file-filter='z64 ROMS (z64) | *.z64' --title="Select your baserom.us.z64 ROM") sm64ex
cd sm64ex
echo "Would you like patches? [y/n]"
read answer
if [ $answer = "y" ]; then
echo "How many?"
read number
for i in {1..$number}; do echo "Chose a file" && git apply $(zenity --file-selection --file-filter='patch files (patch) | *.patch' --title="Select your patch file"); done
fi
echo "Starting compilation of sm64ex..."
IN=$(zenity --list --checklist --title "Build Flags" --text "Flags" --column "" --column "Options" True VERSION=us False VERSION=eu False VERSION=jp False VERSION=sh False TARGET_BITS=32 True TARGET_BITS=64 False TARGET_RPI=1 False TARGET_WEB=1 False WINDOWS_BUILD=1 False OSX_BUILD=1)
if [ $1 == "--jobs" ]; then
make $(echo $IN | tr "|" " ") $2
else
make $(echo $IN | tr "|" " ")
fi
echo "sm64ex compiled!"
