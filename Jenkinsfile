#!/usr/bin/env groovy

node('master') {
  stage('build') {
    checkout scm
    sh "uname -a"
  }

  stage('test') {
    sh "df -klh"
  }

  stage('deploy') {
    sh "touch /tmp/man"
  }
}
