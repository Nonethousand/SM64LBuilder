cd ~/SM64LBuilder/repos
git clone https://github.com/djoslin0/sm64ex-coop.git
if [ -e ~/baserom.us.z64 ]; then
cp ~/baserom.us.z64 sm64ex-coop
cd sm64ex-coop
echo "Would you like patches? [y/n]"
read answer
if [ $answer = "y" ]; then
echo "How many?"
read number
for i in {1..$number}; do echo "Enter your patch location" && read location && git apply $location; done
fi
echo "Starting compilation of sm64ex-coop... (build flags are not available right now.) "
if [ $1 -- "--jobs" ]; then
make $2
else
make
fi
echo "sm64ex-coop compiled!"
else
cd ~/SM64LBuilder/repos
rm sm64ex-coop
echo "baserom.us.z64 not found in home directory. Please put your baserom into your home directory."
fi
