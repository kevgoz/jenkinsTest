pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                git 'https://github.com/kevgoz/jenkinsTest.git'
            }
        }

        stage('Build') {
            steps {
                bat 'mvn clean package -DskipTests'
            }
        }

        stage('Deploy') {
            /*steps {
                bat '''
                taskkill /F /IM java.exe || exit 0
                start java -jar target\\*.jar
                '''
            }*/
            steps {
                bat '''
                taskkill /F /IM java.exe || exit 0
                bat 'java -jar target\\*.jar'
                '''
            }
        }
    }
}