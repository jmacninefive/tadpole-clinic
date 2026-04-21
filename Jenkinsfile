pipeline {
    agent any

    environment {
        mavenImage = 'maven:3.8.4-openjdk-17'
    }

    stages {
        stage('Build') {
            steps {
                withDockerContainer(image: env.mavenImage) {
                    sh 'mvn clean'
                    sh 'mvn compile'
                }
            }
        }
        stage('Test') {
            steps {
                withDockerContainer(image: env.mavenImage) {
                    sh 'mvn test'
                }
            }
        }
        stage('Dockerize') {
            steps {
                sh 'docker build -t tadpole-clinic .'
            }
        }
    }
}
