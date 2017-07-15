# Java 8.131 auto install

Get script from this GIT and run (in the one line command):
* sudo bash -c "$(wget -q -O- https://raw.githubusercontent.com/applerom/java-auto-install/master/start.sh)"
or
* sudo USER_HOME=/some/user/dir bash -c "$(wget -q -O- https://raw.githubusercontent.com/applerom/java-auto-install/master/start.sh)"
or (for distrs with curl istead wget by default)
* sudo bash -c "$(curl https://raw.githubusercontent.com/applerom/java-auto-install/master/start.sh)"
or
* sudo bash -c -x "$(wget -q -O- https://raw.githubusercontent.com/applerom/java-auto-install/master/start.sh)" > 1.txt
For common use:

* cd /usr/local/src
* git clone https://github.com/applerom/java-auto-install
* cd java-auto-install
* chmod +x install.sh
and
* ./install.sh
or
* sudo bash ./install.sh
p.s. Подробности на русском: https://linuxcmd.ru
