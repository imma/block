#!/usr/bin/env groovy

node('master') {
  try {
    stage('build') {
      checkout scm
      sh "uname -a"
    }

    stage('test') {
      sh "df -klh
    }

    stage('deploy') {
      sh "touch /tmp/man
    }
  } 
  catch(error) {
    throw error
  } finally {
      sh "rm /tmp/man
  }
}
