pipeline {
    agent any

    environment {
        mavenImage = 'maven:3.8.4-openjdk-17'
    }

    stages {
        stage('Build and Test') {
            steps {
                withDockerContainer(image: env.mavenImage) {
                    sh 'mvn clean'
                    sh 'mvn compile'
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
