cd ~/SM64LBuilder/repos
git clone https://github.com/KiritoDv/Moon64.git
if [ -e ~/baserom.us.z64 ]; then
cp ~/baserom.us.z64 Moon64
cd Moon64
echo "Would you like patches? [y/n]"
read answer
if [ $answer = "y" ]; then
echo "How many?"
read number
for i in {1..$number}; do echo "Enter your patch location" && read location && git apply $location; done
fi
echo "Starting compilation of Moon64... (build flags are not available right now.) "
if [ $1 -- "--jobs" ]; then
make $2
else
make
fi
echo "Moon64 compiled!"
else
cd ~/SM64LBuilder/repos
rm Moon64
echo "baserom.us.z64 not found in home directory. Please put your baserom into your home directory."
fi
