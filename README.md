# SM64LBuilder
SM64 Pc Port Builder for linux and Chromebook

***NOT WORKING YET!!***

# For Casual Use
First open the Terminal. Run these commands:
```
git clone https://github.com/HiImBlahh/SM64LBuilder.git
cd SM64LBuilder
chmod 111 builder.sh
./builder.sh <repo name goes here>
```
***or***
```
./builder.sh --custom-repo <github link goes here>
```
If
```
chmod 111 builder.sh
```
doesn't work then run these:
```
sudo apt update
sudo apt install nemo
nemo
```
Go into SM64LBuilder folder and right click builder.sh
Click on proporties then click on permissions.
Click allow executing file as a program
![Screenshot 2021-06-09 2 42 58 PM](https://user-images.githubusercontent.com/78574005/121433689-2ff38100-c931-11eb-99b1-26172a542543.png)

# For testing
First open the Terminal. Run this command:
```
git clone --single-branch --branch tester https://github.com/HiImBlahh/SM64LBuilder.git
```
You now hve the tester branch for testing. This branch is mainly for testing out new shellscripts.
