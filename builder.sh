if [ -d $1 ]; then
echo $1 " found! Compiling..."
chmod 755 $1 .sh
sh $1 .sh
else
echo $1 " not found!"
fi

