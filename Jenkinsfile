#!groovy

pipeline {
	agent {
		docker { image 'python:3.9' }
	}

	stages {
		stage("Install dependencies") {
			steps {
				sh "make deps"
				sh "make dev-deps"
			}
		}

		stage("Checkstyle") {
			steps {
				sh "make checkstyle"
			}
		}

		stage("Test") {
			steps {
				sh "make test"
			}
			post {
				always {
					junit "junit/test-results.xml"
				}
			}
		}
	}
}