pipeline {
    agent any
    environment {
        DOCKERHUB_REPO = 'lalaaicha422/docker-jenkins-integration'
        DOCKERHUB_CREDS     = credentials('Docker-Hub-id')
    }
    stages {
        stage('Source') {
            steps {
                echo 'Checking into GitHub'
                git credentialsId: 'github-access-id', url: 'https://github.com/lalacloudspace/Docker-Jenkins-Integration'
            }
        }
         stage('Build') {
            steps {
                echo 'Hello World'
                sh 'docker build -t ${DOCKERHUB_REPO}:v${BUILD_NUMBER} .'
            }
        }
        stage('docker login') {
            steps {
                echo 'login into docker hub'
                sh 'docker login -u ${DOCKERHUB_CREDS_USR}  -p ${DOCKERHUB_CREDS_PSW}'
            }
        }
         stage('Deploy') {
            steps {
                echo 'Pushing image to docker hub'
                 sh 'docker push ${DOCKERHUB_REPO}:v${BUILD_NUMBER}'
            }
        }
    }
}
