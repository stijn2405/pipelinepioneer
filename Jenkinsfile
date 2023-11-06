pipeline {
    agent any

    environment {
        // Define environment variables, image name and tag
        DOCKER_IMAGE_NAME = 'knakkergithub/proftaakdocker'
        DOCKER_IMAGE_TAG = 'latest'
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout source code repository (only if source code)
                checkout scm
            }
        }

        stage('Pull Docker Image') {
            steps {
                // Pull the Docker image from Docker Hub
                script {
                    docker.image("${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}").pull()
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                // Build a new Docker image based on the pulled image
                script {
                    def dockerImage = docker.build("${DOCKER_IMAGE_NAME}:${DOCKER_IMAGE_TAG}", ".")
                    dockerImage.push()
                }
            }
        }
    }

    post {
        success {
            echo "Docker image build and push successful"
        }
    }
}
