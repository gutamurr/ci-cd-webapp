pipeline {
	agent any

	tools {
		dockerTool 'docker'
	}

	stages {
		stage('Build') {
			steps {
				sh 'git clone https://github.com/gutamurr/ci-cd-webapp.git'
				sh 'docker build -t web-app .'
			}
		}

		stage('Test') {
			steps {
				sh 'curl --fail http://localhost:5000/health'
			}
		}

		stage('Deploy') {
			steps {
				sh 'docker run -d -p 5000:5000 web-app'
			}
		}

	}
}