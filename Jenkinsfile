pipeline {
    agent any

    environment {
        IMAGE_NAME = 'dharshangk/portfolio'  // Replace with your actual DockerHub repo name
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/GKDHARSHAN/jenkins-k8s-setup.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $IMAGE_NAME .'
                }
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([string(credentialsId: 'dockerhub-credentials', variable: 'DOCKER_PASSWORD')]) {
                    script {
                        sh 'echo $DOCKER_PASSWORD | docker login -u your-dockerhub-username --password-stdin'
                        sh 'docker push $IMAGE_NAME'
                    }
                }
            }
        }

        stage('Deploy Container') {
            steps {
                script {
                    sh 'docker stop portfolio || true'  // Stop if running
                    sh 'docker rm portfolio || true'   // Remove if exists
                    sh 'docker run -d -p 9000:9000 --name portfolio $IMAGE_NAME'
                }
            }
        }
    }
}
