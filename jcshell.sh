#!/bin/sh
#

a=$(readlink -f $0)
b=$(dirname $a)

# Must cd to load the jcshell.rc file
# cd $b

neededjars=$(find jars -type f -exec echo $b/{} \; | tr '\n' ':')

if [ $# -gt 0 ];then
    if [ -d $1 ];then
        JCSHPATH="$1"
        JCSHPATHARG="-D path=$JCSHPATH/"
        [ -f $JCSHPATH/jcshell.rc ] && JCSHELLRC="--rc $JCSHPATH/jcshell.rc"
    fi
fi

# The sdkman provided java needs to dynamically link to the PCSC native library 
# in order to talk to the reader. If you use an OS-provided java, then there
# is no need for this.
export _JAVA_OPTIONS=-Dsun.security.smartcardio.library=/usr/lib/x86_64-linux-gnu/libpcsclite.so

java -cp $neededjars com.ibm.jc.tools.JCShell $JCSHELLRC $JCSHPATHARG
