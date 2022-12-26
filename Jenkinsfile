pipeline {
    agent any
    stages{
        stage('Git Checkout') {
            steps{
                echo "First Pipeline job in jenkins"
                git branch: 'main', credentialsId: 'git-creds', url: 'https://github.com/Tangala123/mvn-job'
            }
        }
        stage('Maven Build') {
            steps {
                sh "mvn clean package"
            }
        }
        stage('Tomcat Deploy') {
            steps {
                sshagent(['tomcat']) {
                sh "scp -o StrictHostKeyChecking=no target/*.war ec2-user@172.31.93.181:/opt/tomcat009/webapps"
                sh "ssh ec2-user@172.31.93.181 /opt/tomcat009/bin/shutdown.sh"
                sh "ssh ec2-user@172.31.93.181 /opt/tomcat009/bin/startup.sh"
                }
            }
        }
    }
}
