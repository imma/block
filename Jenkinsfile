#!/usr/bin/env groovy

stage('bootstrap') {
  node {
    dir('work') {
      BLOCK_PATH= sh (script: 'pwd', returnStdout: true).trim()
      checkout scm
      sh "env BLOCK_PATH='${BLOCK_PATH}' script/cibuild"
    }
  }
}
