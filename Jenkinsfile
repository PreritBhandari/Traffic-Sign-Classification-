pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            /* Cloning the repo to our work environment */
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'sudo DOCKER_BUILDKIT=1 docker build -t preritbhandari/tscwithdevops:v1 .'
                }
            }
        }


        stage('Push Docker Image in dockerhub') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerHubPwd')]) {
                        // some block
                        sh "sudo docker login -u preritbhandari -p ${dockerHubPwd}"
                    }
                    sh 'sudo docker push preritbhandari/tscwithdevops:v1'
                }
            }
        }


        stage('Run Container on server') {
            steps {
                script {
                    sh 'sudo docker run -it -p 5000:80 --network host -d --name tscserver preritbhandari/tscwithdevops:v1 '
                }
            }
        }
    }
}

