sudo apt install build-essential libglew-dev libsdl2-dev
cd ~/SM64LBuilder/repos
git clone --single-branch --branch alpha https://github.com/Render96/Render96ex.git
echo "Please select your baserom.us.z64."
cp $(zenity --file-selection --file-filter='z64 ROMS (z64) | *.z64' --title="Select your baserom.us.z64 ROM") Render96ex
cd Render96ex
echo "Would you like patches? [y/n]"
read answer
if [ $answer = "y" ]; then
echo "How many?"
read number
for i in {1..$number}; do echo "Chose a file" && git apply $(zenity --file-selection --file-filter='patch files (patch) | *.patch' --title="Select your patch file"); done
fi
echo "Starting compilation of Render96ex... (build flags are not available right now.) "
if [ $1 -- "--jobs" ]; then
make $(zenity --forms --title="Build Flags" --add-entry=Flags) $2
else
make $(zenity --forms --title="Build Flags" --add-entry=Flags)
fi
echo "Render96ex compiled!"
