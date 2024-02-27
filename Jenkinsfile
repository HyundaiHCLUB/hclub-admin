pipeline {
    agent any

    stages {
       stage('CLONE')
        {
        steps{
           git branch : 'prod', credentialsId : 'git-token' ,url : 'https://github.com/HyndaiFinalProject/hclub-admin.git'
            sh '''
            cd /var/jenkins_home/workspace/hclub-admin
            '''
        }
           
        }
        stage('PUT application.yml'){
            steps{
                sh '''
                cd /var/jenkins_home/workspace/hclub-admin
                echo 'current dir ' ${PWD}
                cp /var/jenkins_home/config/application.yml /var/jenkins_home/workspace/hclub-admin/src/main/resources
                '''
                
            }
        }
        
        stage('Docker Build')
        {
        steps{
           
            sh '''
           echo 'Build dir' ${PWD}
           cd /var/jenkins_home/workspace/hclub-admin
           docker stop hclub-admin || true
           docker rm hclub-admin || true
           
           docker rmi popopododo/hclub-admin || true
           
           docker build -t popopododo/hclub-admin .
            '''
        }
           
        }
        
        stage('Docker Deploy')
        {
        steps{
           
            sh '''
           docker run --name hclub-admin -d -p 8083:8080 popopododo/hclub-admin
            '''
        }
           
        }
    }
   
}