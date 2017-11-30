#!/usr/bin/env groovy

stage('bootstrap') {
  node {
    dir "tmp" {
      checkout scm
    }

    dir "tmp" {
      sh 'script/cibuild'
    }
  }
}
