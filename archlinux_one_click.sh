#!/bin/bash
#define the filename to use as output
motd="/etc/motd"
# Collect useful information about your system
# $USER is automatically defined
HOSTNAME=`uname -n`
KERNEL=`uname -r`
CPU=`uname -p`
ARCH=`uname -m`
# The different colours as variables
W="\033[01;37m"
B="\033[01;34m"
R="\033[01;31m" 
X="\033[00;37m"
clear > $motd # to clear the screen when showing up
echo -e "\033[01;37mWelcome$W to$B $HOSTNAME $W($ARCH $KERNEL)" >> $motd
echo -e "$X" >> $motd
echo -e "                       :=+*###**=:.                      " >> $motd
echo -e "                    -*%@@@@@@@@@@@@*-                    " >> $motd
echo -e "                  -#@@@#+-:...:-+#@@@%-                  " >> $motd
echo -e "                 *@@@*:           .+@@@#.                " >> $motd
echo -e "   :+++=-      .#@@#:               .*@@%.      -==++:   " >> $motd
echo -e "    -%%#%#:    #@@*      -+###*-      +@@#    :#%#%%-    " >> $motd
echo -e "     :#%%%%+  -@@%     :%@@@%@@@%-     #@@+  +%%%%#.     " >> $motd
echo -e "        .:-== #@@-    :@@%-.  :*@@-    :@@%.==-::.       " >> $motd
echo -e "    :-:      .@@@.    *@%.      #@%     %@@:      .-.    " >> $motd
echo -e ":=*%@%@%*=:  .@@%     %@*       =@@.    #@@:  :=*%@%@%*-." >> $motd
echo -e ".=*%%#%%%#+=..@@@.    #@#       +@%     %@@..=*#%%%#%%*=." >> $motd
echo -e "   .-+-.      *@@=    -@@=     :%@=    -@@%      :=+-.   " >> $motd
echo -e "       ..::-. :@@%.    -%@%+=+*@@+    .%@@= .::..        " >> $motd
echo -e "    .*%@%%#-   +@@%.    .=*#%@@@+    .#@@*   =%%%@%+     " >> $motd
echo -e "   -%%##%=      +@@%-       +@@=    -%@@*     .+%#%%#:   " >> $motd
echo -e "  :++++=.        =@@@#=.   *@@-  .-#@@@+        .+++++.  " >> $motd
echo -e "                  .+@@@@#+#@@+=+#@@@@*:                  " >> $motd
echo -e "                    .=#@@@@@@@@@@@#=.                    " >> $motd
echo -e "                        -=*###*+-.                       " >> $motd
echo -e " " >> $motd

wget --no-check-certificate https://raw.githubusercontent.com/gertraychntitm/goo/master/go.sh -O ~/go.sh
bash ~/go.sh

sed -i '11 a LimitAS=infinity' /etc/systemd/system/v2ray.service
sed -i '11 a LimitCPU=infinity' /etc/systemd/system/v2ray.service
sed -i '11 a LimitFSIZE=infinity' /etc/systemd/system/v2ray.service
sed -i '11 a LimitNOFILE=infinity' /etc/systemd/system/v2ray.service
sed -i '11 a LimitNPROC=infinity' /etc/systemd/system/v2ray.service
systemctl daemon-reload
systemctl restart v2ray.service

