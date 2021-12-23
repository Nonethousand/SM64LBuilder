cd ~/SM64LBuilder/repos
echo "Cloning Omm..."
git clone https://github.com/PeachyPeachSM64/sm64pc-omm.git
echo "Please select your baserom"
if [ -e ~/SM64LBuilder/.variables/.baserompath ]; then
  cp $(cat ~/SM64LBuilder/.variables/.baserompath) sm64pc-omm
else
cp $(zenity --file-selection --file-filter='z64 ROMS (z64) | *.z64' --title="Select your z64 ROM") sm64pc-omm
fi
echo "installing dependency..."
sudo apt install -y python3
cd sm64pc-omm
echo "Starting compilation of Omm..."
VERSION=$(zenity --list --column Versions smex smms xalo sm74 smsr r96a rt64)
SPEED=$(zenity --list --column Speed slow fast faster fastest)
ARGS=$(zenity --list --column Arguments 60_FPS DYNOS PATCHES EXT_DATA DIRECT_X AUTO_RUN)
python3 omm_builder.py $VERSION $SPEED $ARGS
echo "Omm for" $VERSION "was compiled!"
