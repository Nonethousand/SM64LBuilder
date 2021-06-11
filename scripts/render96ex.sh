sudo apt install build-essential libglew-dev libsdl2-dev
cd ~/SM64LBuilder/repos
git clone --single-branch --branch alpha https://github.com/Render96/Render96ex.git
if [ -e ~/baserom.us.z64 ]; then
cp ~/baserom.us.z64 Render96ex
cd Render96ex
echo "Would you like patches? [y/n]"
read answer
if [ $answer = "y" ]; then
echo "How many?"
read number
for i in {1..$number}; do echo "Enter your patch location" && read location && git apply $location; done
fi
echo "Starting compilation of Render96ex... (build flags are not available right now.) "
if [ $1 -- "--jobs" ]; then
make $2
else
make
fi
echo "Render96ex compiled!"
else
cd ~/SM64LBuilder/repos
rm Render96ex
echo "baserom.us.z64 not found in home directory. Please put your baserom into your home directory."
fi
