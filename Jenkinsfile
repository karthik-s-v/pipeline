pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'karthisrng/new'
    }

    stages {
        stage('Checkout') {
            steps {
               withCredentials([usernamePassword(credentialsId: 'github-token', usernameVariable: 'GIT_USER', passwordVariable: 'GIT_PASS')]) {
    git branch: 'main', url: "https://${GIT_USER}:${GIT_PASS}@github.com/karthik-s-v/pipeline.git"
}

                }
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    bat "docker build -t %DOCKER_IMAGE%:latest ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    bat "docker run -d -p 8080:80 --name my-container %DOCKER_IMAGE%:latest"
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution finished.'
        }
        success {
            echo 'Pipeline executed successfully!'
        }
        failure {
            echo 'Pipeline failed. Check logs.'
        }
    }
