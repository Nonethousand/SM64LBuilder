cd ~/SM64LBuilder/repos
git clone https://github.com/n64decomp/sm64.git
if [ -e ~/baserom.us.z64 ]; then
cp ~/baserom.us.z64 sm64
cd sm64
echo "Starting compilation of sm64... (build flags and jobs are not available right now.) "
make
echo "sm64 compiled!"
else
cd ~/SM64LBuilder/repos
rm sm64
echo "baserom.us.z64 not found in home directory. Please put your baserom into your home directory."
fi
