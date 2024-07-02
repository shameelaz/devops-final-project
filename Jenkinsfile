pipeline {
    agent any

    stages {
        stage('Clean Workspace') {
            steps {
                cleanWs()
            }
        }

        stage('Clone Repository') {
            steps {
                git 'https://github.com/shameelaz/devops-final-project.git'
            }
        }

        stage('Set up Docker') {
            steps {
                script {
                    bat 'docker --version'
                }
            }
        }

        stage('Build Docker Images') {
            steps {
                script {
                    bat 'powershell Start-Process "docker" -ArgumentList "build -t service1 -f Dockerfile.service1 ." -Verb RunAs'
                    bat 'powershell Start-Process "docker" -ArgumentList "build -t service2 -f Dockerfile.service2 ." -Verb RunAs'
                }
            }
        }

        stage('Deploy using Docker Compose') {
            steps {
                script {
                    bat 'powershell Start-Process "docker-compose" -ArgumentList "up -d" -Verb RunAs'
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}
