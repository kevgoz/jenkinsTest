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
            /* steps {
                bat '''
                for /f "tokens=5" %%a in ('netstat -ano ^| findstr :8082') do taskkill /PID %%a /F
                start /B java -jar target\\single-rest-0.0.1-SNAPSHOT.jar
                '''
            }*/
              steps {
                bat '''
                for /f "tokens=5" %%a in ('netstat -ano ^| findstr :8092') do taskkill /PID %%a /F
                cmd /c start "" /MIN java -jar target\\single-rest-0.0.1-SNAPSHOT.jar
                '''
            }
        }
    }
}