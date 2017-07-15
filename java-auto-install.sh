#!/bin/bash

JDK_DIR=/usr/lib/jvm/jdk8
TMP_DIR=/tmp
JAVA_TYPES="java javac javaws jar"

## set custom if you want, to example:
## sudo USER_HOME=/home/ubuntu bash -c "$(wget -q -O- https://raw.githubusercontent.com/applerom/linuxcmd/master/start.sh)"
if [ -z ${USER_HOME+z} ]; then
	USER_HOME=$PWD # use current directory as home
fi

cd $TMP_DIR
wget -O jdk8-linux.tar.gz --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie"  "http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz"
tar xvfz jdk8-linux.tar.gz
mv jdk1.* $JDK_DIR

java -version

function set_java_types {
  update-alternatives --install /usr/bin/$1 $1 /usr/lib/jvm/jdk8/bin/$1 1
  update-alternatives --set $1 $JDK_DIR/bin/$1
  ls -la /etc/alternatives/$1
}

for i in $JAVA_TYPES; do set_java_types $i; done

function set_java_home {
  if cat $1 | grep "JAVA_HOME" ; then # protect from repeating
    echo "There is JAVA_HOME in $1 - skip adding."
  else
    cat <<EOF >>$1
JAVA_HOME=$JDK_DIR
export JAVA_HOME
JDK_HOME=$JDK_DIR
export JDK_HOME
PATH=\$PATH:\$JDK_HOME/bin
export PATH
EOF
  fi
}

set_java_home $USER_HOME/.bashrc
set_java_home /root/.bashrc
