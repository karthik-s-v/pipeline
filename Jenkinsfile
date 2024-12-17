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

        stage('Build Docker Image') {
            steps {
                script {
                    // Use 'bat' for Windows
                    bat "docker build -t %DOCKER_IMAGE%:latest ."
                }
            }
        }

        stage('Run Docker Container') {
    steps {
        script {
            bat '''
            docker ps -a -q --filter "name=my-container1" | findstr . && docker rm -f my-container1 || echo "No container to remove"
            docker run -d -p 9090:80 --name my-container1 karthisrng/new:latest
            '''
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
}
