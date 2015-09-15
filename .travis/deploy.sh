#!/bin/bash

stop() {
  echo $* >&2
  exit 0
}

[ "${TRAVIS_BRANCH}" == "${SNAPSHOT_BRANCH}" ] \
  || stop "won't deploy branch ${TRAVIS_BRANCH}"

[ "${TRAVIS_SECURE_ENV_VARS}" == "true" ] \
  || stop "no secure enviroment variables were provided"

[ "${TRAVIS_JOB_NUMBER}" == "${TRAVIS_BUILD_NUMBER}.1" ] \
  || stop "only the first build job will be deployed"

[ "${TRAVIS_PULL_REQUEST}" == "false" ] \
  || stop "no deployment for pull requests"

if ! grep '<version>' pom.xml | head -1 | grep SNAPSHOT; then
  stop "no deployment of release version"
fi

mvn deploy -DskipTests=true --settings ".travis/maven-settings.xml"


