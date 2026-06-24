pipeline {
	agent any
	tools {
		dockerTool 'docker'
	}
	
	environment {
        DOCKER_API_VERSION = '1.54'
    }

	stages {
		stage("Checkout") {
			steps {
				git branch: 'master', url: 'https://github.com/gutamurr/ci-cd-webapp.git'
			}
		}

		stage("Build") {
			steps {
				script {
					docker.build("ci-cd-webapp")
				}
			}
		}

		stage("Run") {
			steps {
				script {
					sh "docker rm -f webapp-container || true"
					docker.image("ci-cd-webapp").run("-p 8080:5000 --name webapp-container")
				}
			}
		}

		stage("Test") {
			steps {
				script {
					sh "curl http://localhost:8080/health"
				}
			}
		}

	}
}