cd ~/SM64LBuilder/repos
git clone https://github.com/KiritoDv/Moon64.git
if [ -e ~/baserom.us.z64 ]; then
cp ~/baserom.us.z64 Moon64
cd Moon64
echo "Starting compilation of Moon64... (build flags and jobs are not available right now.) "
make
echo "Moon64 compiled!"
else
cd ~/SM64LBuilder/repos
rm Moon64
echo "baserom.us.z64 not found in home directory. Please put your baserom into your home directory."
fi
