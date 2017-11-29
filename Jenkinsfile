#!/usr/bin/env groovy

stage('compile') {
  node {
    checkout scm
    stash 'everything'
    dir('src/cafe') {
      sh "echo dont care"
    }
  }
}
