pipeline {
    environment {
        registry = "rsaurabh135/Scientific_Calc"
        registryCredential = 'docker-jenkins'
        dockerImage = ''
        dockerImageLatest = ''
  }
    agent any
    stages {
        stage ('SCM Checkout') {
            steps {
                git credentialsId: 'github-credentials', url: 'https://github.com/rsaurabh2803/SPE_Scientific_Calc.git'
            }
        }

        stage('Build Executable Jar'){
                steps {
                     sh 'mvn clean test package'
                }
        }

        stage('Building Docker Image') {
          steps{
            script {
              dockerImage = docker.build registry + ":${env.BUILD_NUMBER}"
              dockerImageLatest = docker.build registry + ":latest"
            }
          }
        }

        stage('Push Docker Image to DockerHub') {
              steps{
                script {
                  docker.withRegistry( '', registryCredential ) {
                    dockerImage.push()
                    dockerImageLatest.push()
                  }
                }
              }
        }

        stage('Remove Unused docker images') {
          steps{
            sh "docker rmi $registry:${env.BUILD_NUMBER}"
            sh "docker rmi $registry:latest"
          }
        }

        stage ('Deploy Code to Host') {
            steps {
                ansiblePlaybook installation: 'Ansible', playbook: 'scientific-calculator-playbook.yml'
            }
        }
    }
}
