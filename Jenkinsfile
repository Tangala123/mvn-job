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
               sh " docker build -t tangalalakshmi/mvn-job:${commit_id()} . "
            }
        }
        stage ('Docker push') {
           steps {
              withCredentials([string(credentialsId: 'docker-hub', variable: 'hubpwd')]) {
                  sh " docker login -u tangalalakshmi -p ${hubpwd} "
                  sh " docker push tangalalakshmi/mvn-job:${commit_id()} "
              }
            }    
        }
        stage ('Docker deploy') {
           steps {
            sshagent(['docker-host']) {
             sh " ssh -o StrictHostKeyChecking=no ec2-user@172.31.89.94 docker rm -f mvn-job"
             sh "ssh  ec2-user@172.31.89.94 docker run -d -p 8080:8080 --name mvn-job tangalalakshmi/mvn-job:${commit_id()}"  
            }
          }
       }   
    }   
}
def commit_id() {
    id = sh returnStdout: true, script: 'git rev-parse HEAD'
    return id
}    
 
  
