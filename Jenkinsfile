#!/usr/bin/env groovy

pipeline {
	environment {
		BLOCK_PWD= sh (script: 'pwd', returnStdout: true).trim()
    BLOCK_PATH= "${BLOCK_PWD}/work"
  }

	stages {
		stage('bootstrap') {
			node {
				dir('work') {
					checkout scm
					sh 'script/cibuild'
				}
			}
		}
	}
}
