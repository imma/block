#!/usr/bin/env groovy

stage('bootstrap') {
  node {
    dir "tmp" {
      checkout scm
      sh 'script/cibuild'
    }
  }
}
