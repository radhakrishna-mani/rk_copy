pipeline {
    agent {
     node {
         label 'slave'
     }  
    }
    tools {
            maven '3.6.3'
}

    stages {
      stage('clean up') {
            steps {
                echo 'Hello build dir'
                deleteDir()
            }
        }
        stage('clone repo') {
            steps {
                echo 'Clone repo'
                sh " git clone https://github.com/jenkins-docs/simple-java-maven-app"
            }
        }
        stage('build') {
            steps {
                 dir('simple-java-maven-app'){
                    sh("mvn clean install")
                 }
            }
        }
        stage('test') {
            steps {
                 dir('simple-java-maven-app'){
                    sh("mvn test")
                 }
            }
        }
        stage('Deliver') {
            steps {
                dir('simple-java-maven-app'){
                sh './jenkins/scripts/deliver.sh'
                }
            }
        }
    }
}

