#!/usr/bin/env sh

##############################################################################
##
##  Gradle start up script for UN*X
##
##############################################################################

# Add default JVM options here. You can also use JAVA_OPTS and GRADLE_OPTS to pass JVM options to this script.
DEFAULT_JVM_OPTS=""

APP_NAME="Gradle"
APP_BASE_NAME=`basename "$0"`

# Resolve links: $0 may be a link
PRG="$0"
while [ -h "$PRG" ] ; do
  ls=`ls -ld "$PRG"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '.*/.*' > /dev/null; then
    PRG="$link"
  else
    PRG=`dirname "$PRG"`/"$link"
  fi
done
SAVED="`pwd`"
cd "`dirname \"$PRG\"`/" >&-
APP_HOME="`pwd -P`"
cd "$SAVED" >&-

# Add default JVM options to JAVA_OPTS. This can be done here so that it is picked up after the first test (JAVA_OPTS is defined in that test).
JAVA_OPTS="$JAVA_OPTS $DEFAULT_JVM_OPTS"

# Determine the Java command to use to start the JVM.
if [ -n "$JAVA_HOME" ] ; then
  if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
    # IBM's JDK on AIX uses strange locations for the executables
    JAVACMD="$JAVA_HOME/jre/sh/java"
  else
    JAVACMD="$JAVA_HOME/bin/java"
  fi
  if [ ! -x "$JAVACMD" ] ; then
    die "ERROR: JAVA_HOME is set to an invalid directory: $JAVA_HOME

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
  fi
else
  JAVACMD=`which java`
  if [ -z "$JAVACMD" ] ; then
    die "ERROR: JAVA_HOME is not set and no 'java' command could be found in your PATH.

Please set the JAVA_HOME variable in your environment to match the
location of your Java installation."
  fi
fi

# Increase the maximum file descriptors if we can.
if [ -z "$GRADLE_OPTS" ] ; then
  GRADLE_OPTS="-Xmx64m"
fi

# Determine the current version of the tool
GRADLE_VERSION=7.3.3

# Determine the current operating system
cygwin=false
msys=false
darwin=false
case "`uname`" in
  Darwin*) darwin=true ;;
  CYGWIN*) cygwin=true ;;
  MINGW*) msys=true ;;
esac

CLASSPATH=$APP_HOME/gradle/wrapper/gradle-wrapper.jar

# For Cygwin, switch paths to Windows format before running java
if $cygwin ; then
  APP_HOME=`cygpath --path --mixed "$APP_HOME"`
  JAVACMD=`cygpath --unix "$JAVACMD"`
fi

# For Msys, switch paths to Windows format before running java
if $msys ; then
  APP_HOME=`cmd //c "for %I in (\"$APP_HOME\") do @echo %~sI"`
fi

# Collect all arguments for the java command, following the shell conventions for quoting and escaping
ARGS=()
while [ "$#" -gt 0 ] ; do
  case "$1" in
    *' '*) ARGS+=("\"$1\"") ;;
    *) ARGS+=("$1") ;;
  esac
  shift
done

exec "$JAVACMD" $JAVA_OPTS $GRADLE_OPTS -classpath "$CLASSPATH" org.gradle.wrapper.GradleWrapperMain "${ARGS[@]}"