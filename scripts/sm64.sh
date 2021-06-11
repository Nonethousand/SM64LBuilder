cd ~/SM64LBuilder/repos
git clone https://github.com/n64decomp/sm64.git
if [ -e ~/baserom.us.z64 ]; then
cp ~/baserom.us.z64 sm64
cd sm64
echo "Would you like patches? [y/n]"
read answer
if [ $answer = "y" ]; then
echo "How many?"
read number
for i in {1..$number}; do echo "Enter your patch location" && read location && git apply $location; done
fi
echo "Starting compilation of sm64... (build flags are not available right now.) "
if [ $1 -- "--jobs" ]; then
make $2
else
make
fi
echo "sm64 compiled!"
else
cd ~/SM64LBuilder/repos
rm sm64
echo "baserom.us.z64 not found in home directory. Please put your baserom into your home directory."
fi
