#!/usr/bin/env groovy

pipeline {
  agent any

  stages {
    stage('build') {
      steps {
        checkout scm
        sh "uname -a"
      }
    }

    stage('test') {
      steps {
        sh "df -klh"
      }
    }

    stage('deploy') {
      steps {
        sh "touch /tmp/man"
      }
    }
  }
}
