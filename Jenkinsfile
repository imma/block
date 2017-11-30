#!/usr/bin/env groovy

stage('bootstrap') {
  node {
    dir('work') {
      checkout scm
      sh 'script/cibuild'
    }
  }
}
