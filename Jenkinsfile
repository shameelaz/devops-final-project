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
                    bat 'docker build -t devops-final-project .'
                }
            }
        }

        stage('Serve Web Application') {
            steps {
                script {
                    bat 'npm start'
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
