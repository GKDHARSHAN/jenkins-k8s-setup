pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/GKDHARSHAN/jenkins-k8s-setup.git'
            }
        }
        stage('Build') {
            steps {
                echo 'Building...'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying...'
            }
        }
    }
}
