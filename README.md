# SM64LBuilder
SM64 Pc Port Builder for linux and Chromebook

***It's working, but for some reason always builds with --custom-repo.***

Only 5 built in repo scripts so far. Will add more soon.

# For Casual Use
First open the Terminal. Run these commands:
```
git clone https://github.com/HiImBlahh/SM64LBuilder.git
cd SM64LBuilder
chmod 755 builder.sh
./builder.sh <repo name goes here>
```
***or***
```
./builder.sh --custom-repo <github link goes here> <repo folder name goes here>
```
# How to see the built in repo scripts
```
Go to ~/SM64LBuilder/scripts
```
# For testing
First open the Terminal. Run this command:
```
git clone --single-branch --branch Tester https://github.com/HiImBlahh/SM64LBuilder.git
```
You now hve the tester branch for testing. This branch is mainly for testing out new shellscripts.
