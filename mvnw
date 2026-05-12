#!/bin/sh
# ----------------------------------------------------------------------------
# Licensed to the Apache Software Foundation (ASF)
# ----------------------------------------------------------------------------

# Resolve links
PRG="$0"
while [ -h "$PRG" ]; do
  ls=`ls -ld "$PRG"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '/.*' > /dev/null; then
    PRG="$link"
  else
    PRG=`dirname "$PRG"`/"$link"
  fi
done

PRGDIR=`dirname "$PRG"`
BASEDIR=`cd "$PRGDIR" >/dev/null; pwd`

WRAPPER_JAR="$BASEDIR/.mvn/wrapper/maven-wrapper.jar"
WRAPPER_URL="https://repo.maven.apache.org/maven2/org/apache/maven/wrapper/maven-wrapper/3.2.0/maven-wrapper-3.2.0.jar"

# Find java
if [ -n "$JAVA_HOME" ] ; then
  JAVACMD="$JAVA_HOME/bin/java"
else
  JAVACMD="`which java`"
fi

if [ ! -x "$JAVACMD" ] ; then
  echo "Error: JAVA_HOME is not defined correctly." >&2
  exit 1
fi

# Download wrapper jar if missing
if [ ! -f "$WRAPPER_JAR" ]; then
  echo "Downloading Maven Wrapper..."
  if command -v wget > /dev/null; then
    wget -O "$WRAPPER_JAR" "$WRAPPER_URL"
  elif command -v curl > /dev/null; then
    curl -o "$WRAPPER_JAR" "$WRAPPER_URL"
  fi
fi

exec "$JAVACMD" \
  $MAVEN_OPTS \
  -Dmaven.multiModuleProjectDirectory="$BASEDIR" \
  -classpath "$WRAPPER_JAR" \
  org.apache.maven.wrapper.MavenWrapperMain "$@"
