pipeline {
    agent any

    environment {
        DOCKER_USER = credentials('docker-user')       // Jenkins credential ID for Docker username
        DOCKER_PASSWORD = credentials('docker-password') // Jenkins credential ID for Docker password/token
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Login to Docker Hub') {
            steps {
                script {
                    sh """
                        echo $DOCKER_PASSWORD | docker login -u $DOCKER_USER --password-stdin
                    """
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t krons/my_apps:flask-app-gh-actions .'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker push krons/my_apps:flask-app-gh-actions'
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
        success {
            echo 'Docker image built and pushed successfully!'
        }
        failure {
            echo 'Pipeline failed.'
        }
    }
}

