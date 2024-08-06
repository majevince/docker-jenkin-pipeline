pipeline {
    agent any

    environment {
        DOCKER_HUB_CREDENTIALS = credentials('docker-hub-credentials')
        IMAGE_NAME = 'nginx'
        IMAGE_TAG = 'latest'
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Checkout the repository containing the Dockerfile
                git url: 'https://github.com/majevince/docker-jenkin-pipeline.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image
                    sh "sudo docker build -t  ${env.IMAGE_NAME}:${env.IMAGE_TAG} ."
                }
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    // Login to Docker Hub
                    sh " echo ${env.DOCKER_HUB_CREDENTIALS_PSW} | docker login -u ${env.DOCKER_HUB_CREDENTIALS_USR} --password-stdin"
                }
            }
        }

        stage('sudo ush Docker Image') {
            steps {
                script {
                    // Push the Docker image to Docker Hub
                    sh "sudo  docker tag ${env.IMAGE_NAME}:${env.IMAGE_TAG}  majevince/${env.IMAGE_NAME}:${env.IMAGE_TAG}"
                    sh "sudo  docker push majevince/${env.IMAGE_NAME}:${env.IMAGE_TAG}"
                }
            }
        }
    }

    post {
        always {
            script {
                // Clean up Docker images to free up space
                sh 'sudo  docker image prune -af'
            }
        }
    }
}
