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
                    bat 'docker build -t task-1 .'
                }
            }
            steps {
                script {
                    bat 'docker build -t task-2 .'
                }
            }
        }

        stage('Deploy using Docker Compose') {
            steps {
                script {
                    bat 'docker-compose up -d'
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
