# SM64LBuilder
SM64 Pc Port Builder for linux and Chromebook

Only 5 built in repo scripts so far. Will add more soon.

Run
```
./builder --help
```
for help.

# For Casual Use
First open the Terminal. Run these commands:
```
git clone https://github.com/HiImBlahh/SM64LBuilder.git
cd SM64LBuilder
chmod 755 builder.sh
./builder.sh <--jobs (optional)> <jobs (optional>
```
***or***
```
./builder.sh --custom-repo <github link goes here> <repo folder name goes here>
```
# How to see the built in repo scripts
```
./builder --library
```
To build with a built in repo script just type in the script name after
```
./builder.sh
```
but remove the .sh
# For testing
First open the Terminal. Run this command:
```
git clone --single-branch --branch Tester https://github.com/HiImBlahh/SM64LBuilder.git
```
You now hve the tester branch for testing. This branch is mainly for testing out new shellscripts.

# How to remove a repo
```
./builder.sh --remove-repo <repo name>
```

# How to remove the builder
```
./builder.sh --remove-builder
```
# Screenshots


![Screenshot 2021-06-10 2 54 32 PM](https://user-images.githubusercontent.com/78574005/121602274-e9b72400-c9fb-11eb-80e7-bb1fc4964a55.png)

Discord: https://discord.gg/HTbgkXF5
