#!/bin/bash

if [ "$PUBLISH_SNAPSHOTS" == "false" ]; then
  echo -e "Generating javadocs will be skipped since Travis CI build indicates that we are not publishing snapshots.\n"
  ./gradlew checkstyleMain bootRepackage --parallel -x test -x javadoc --stacktrace --build-cache --max-workers=4 --configure-on-demand --no-daemon
else
  echo -e "Travis CI build indicates that tests should not run since we are publishing snapshots.\n"
  ./gradlew javadoc bootRepackage install --parallel -x test --stacktrace --build-cache -x check --max-workers=4 --configure-on-demand --no-daemon
fi
