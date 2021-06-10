if [ $1 -eq --custom-repo ]; then
cd repos
git clone $1
if [ -e ~/baserom.us.z64 ]; then
cp ~/baserom.us.z64 $2
cd $2
echo "Starting compilation of $2... (build flags and jobs are not available right now.) "
make
echo $2 "compiled!"
else
cd ~/SM64LBuilder/repos
rm $2
echo "baserom.us.z64 not found in home directory. Please put your baserom into your home directory."
fi
else
cd scripts
if [ -e $1.sh ]; then
echo $1 "found! Cloning the repo..."
chmod 755 $1.sh
sh $1.sh
else
echo $1 "not found!"
fi
fi

