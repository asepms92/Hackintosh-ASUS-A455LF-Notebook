#!/bin/bash

if [ "${TARGET_BUILD_DIR}" = "" ]; then
  echo "This must not be run outside of Xcode"
  exit 1
fi

cd "${TARGET_BUILD_DIR}"

# clean / build
if [ "$1" != "analyze" ]; then
  rm -rf package *.zip || exit 1
fi

if [ "$1" != "" ]; then
  echo "Got action $1, skipping!"
  exit 0
fi

# Xcode 10.2 build system seems to have a race condition between
# dependency scheduling, and for some reason does not complete
# the compilation of dependencies even though it should have been.
# Adding a delay here "fixes" it. TODO: bugreport.
if [ ! -f ../libaistat.dylib ]; then
  sleep 5
fi

# Workaround Xcode 10 bug
if [ "$CONFIGURATION" = "" ]; then
  if [ "$(basename "$TARGET_BUILD_DIR")" = "Debug" ]; then
    CONFIGURATION="Debug"
  elif [ "$(basename "$TARGET_BUILD_DIR")" = "Sanitize" ]; then
    CONFIGURATION="Sanitize"
  else
    CONFIGURATION="Release"
  fi
fi

if [ "$CONFIGURATION" = "Release" ]; then
  mkdir -p dSYM || exit 1
  for dsym in ../*.dSYM; do
    if [ "$dsym" = "../*.dSYM" ]; then
      continue
    fi
    echo "$dsym"
    cp -a "$dsym" dSYM/ || exit 1
  done
fi

archive="SerialMouse-${MODULE_VERSION}-$(echo $CONFIGURATION | tr /a-z/ /A-Z/).zip"
zip -qry -FS "${archive}" * || exit 1
