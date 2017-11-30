#!/usr/bin/env groovy

stage('bootstrap') {
  node {
    checkout scm
    sh 'script/cibuild'
  }
}
