pipeline {
    agent any

    environment {
        IMAGE_NAME = 'https://hub.docker.com/repository/docker/dharshangk/portfolio/tags'  // Replace with your DockerHub repo
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
                    sh 'docker run -d -p 8000:8000 --name portfolio $IMAGE_NAME'
                }
            }
        }
    }
}
