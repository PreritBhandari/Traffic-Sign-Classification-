pipeline {
    agent any

    stages {
        stage('Clone Repository'){
            /* Cloning the repo to our work environment */
            steps{
                checkout scm
            }
        }
       
        stage('Build Docker Image') {
            steps {
                script {

                 sh 'sudo docker build -t tscwithdevops:v1 .'

                }
            }
        }

        stage('Push Docker Image in dockerhub') {
            steps {
                script {

                    withCredentials([string(credentialsId: 'dockerhup', variable: 'dockerhp')]) {
                        sh "sudo docker login -u preritbhandari -p ${dockerhp}"

                    }
                         sh 'sudo docker push preritbhandari/tscwithdevops:v1'
              }
            }
          }
        stage('Run Container on server1 and sever2'){
            steps {
                script {
                sh 'sudo docker run -p 9900:4000 -d preritbhandari/tscwithdevops:v1'
                }
            }

        }

    }
}

