cd ~/SM64LBuilder/repos
git clone https://github.com/djoslin0/sm64ex-coop.git
if [ -e ~/baserom.us.z64 ]; then
cp ~/baserom.us.z64 sm64ex-coop
cd sm64ex-coop
echo "Starting compilation of sm64ex-coop... (build flags and jobs are not available right now.) "
make
echo "sm64ex-coop compiled!"
else
cd ~/SM64LBuilder/repos
rm sm64ex-coop
echo "baserom.us.z64 not found in home directory. Please put your baserom into your home directory."
fi
