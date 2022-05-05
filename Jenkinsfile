pipeline {
    agent any

    stages {
        stage('SCM') {
            steps {
                git branch: 'master', url: 'https://github.com/PreritBhandari/Traffic-Sign-Classification-.git'
            }
        }
       e
        stage('Build Docker Image') {
            steps {
                script {

                 sh 'docker build -t tscwithdevops:1 .'

                }
            }
        }



        stage('Push Docker Image in dockerhub') {
            steps {
                script {

                    withCredentials([string(credentialsId: 'dockerhup', variable: 'dockerhp')]) {
                        sh "docker login -u preritbhandari -p ${dockerhp}"

                    }
                            sh 'docker push preritbhandari/tscwithdevops:1'
              }
            }
          }
        stage('Run Container on server1 and sever2'){
            steps {
                script {
                sh 'docker run -p 9900:4000 -d preritbhandari/tscwithdevops:1'
                }


            }

        }

    }
}

