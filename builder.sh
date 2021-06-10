if [ -e scripts/$1 .sh ]; then
echo $1 "found! Compiling..."
chmod 755 scripts/$1 .sh
sh $1 .sh
else
echo $1 "not found!"
fi

