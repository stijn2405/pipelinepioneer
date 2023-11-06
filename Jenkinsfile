pipeline {
    agent any

    environment {
        // Define environment variables, such as image name and tag
        DOCKER_IMAGE_NAME = ''
        DOCKER_IMAGE_TAG = ''
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout your source code repository (if applicable)
                // For example, if you're building from source code
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
