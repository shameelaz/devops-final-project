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

        // stage('Set up Docker') {
        //     steps {
        //         script {
        //             sh 'docker --version'
        //         }
        //     }
        // }

        stage('Build Docker Images') {
            steps {
                script {
                    sh 'docker build -t service1 -f Dockerfile.service1 .'
                    sh 'docker build -t service2 -f Dockerfile.service2 .'
                    // Add more services as needed
                }
            }
        }

        stage('Deploy using Docker Compose') {
            steps {
                script {
                    sh 'docker-compose up -d'
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
