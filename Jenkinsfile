pipeline {
    agent any

    environment {
        APP_NAME = 'single-rest'
        JAR_FILE = "target/${APP_NAME}-0.0.1-SNAPSHOT.jar"
        DEPLOY_USER = ''
        DEPLOY_HOST = ''
        DEPLOY_PATH = ''
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                script {
                    if (isUnix()) {
                        sh './mvnw clean package -DskipTests'
                    } else {
                        bat 'mvnw.cmd clean package -DskipTests'
                    }
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    if (isUnix()) {
                        sh './mvnw test'
                    } else {
                        bat 'mvnw.cmd test'
                    }
                }
            }
        }

        stage('Archive Artifact') {
            steps {
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }

        stage('Deploy') {
            steps {
                script {
                    if (!env.DEPLOY_HOST) {
                        echo 'DEPLOY_HOST not defined; skipping deployment.'
                    } else {
                        if (isUnix()) {
                            sh "scp ${JAR_FILE} ${DEPLOY_USER}@${DEPLOY_HOST}:${DEPLOY_PATH}"
                        } else {
                            bat "scp ${JAR_FILE} ${DEPLOY_USER}@${DEPLOY_HOST}:${DEPLOY_PATH}"
                        }
                        echo 'Deployment step completed. Configure your target server to run the JAR as needed.'
                    }
                }
            }
        }
    }

    post {
        success {
            echo 'Pipeline completed successfully.'
        }
        failure {
            echo 'Pipeline failed. Check the console output for details.'
        }
    }
}
