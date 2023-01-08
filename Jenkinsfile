pipeline {
    agent any
    stages {
        stage ('Maven Build') {
          steps {
                sh "mvn clean package"
            }
        }
        stage ('Docker Build') {
           steps {
                sh " docker build -t tangalalakshmi/mvn-job:0.0.2 . "
            }
        }
        stage ('Docker push') {
           steps {
              withCredentials([string(credentialsId: 'docker-hub', variable: 'hubpwd')]) {
                  sh " docker login -u tangalalakshmi -p ${hubpwd} "
                  sh " docker push tangalalakshmi/mvn-job:0.0.2 "
              }
            }    
        }
    }   
}

