pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t alpine-infra-reporter .'
            }
        }

        stage('Run Container') {
            steps {
                sh '''
                   docker stop alpine-infra-reporter || true
                   docker rm alpine-infra-reporter || true
                   docker run -d -p 5055:5055 --name alpine-infra-reporter alpine-infra-reporter
                '''
            }
        }
    }
}

