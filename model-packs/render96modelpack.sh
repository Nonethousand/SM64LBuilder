if [ -e ~/SM64LBuilder/model-packs/ModelPack ]; then
  cp --force --archive --update --link ~/SM64LBuilder/model-packs/ModelPack ~/SM64LBuilder/repos/$1
else
git clone https://github.com/Render96/ModelPack.git -b models_vanilla
cp --force --archive --update --link ~/SM64LBuilder/model-packs/ModelPack ~/SM64LBuilder/repos/$1
fi
