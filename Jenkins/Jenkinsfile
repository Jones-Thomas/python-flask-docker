pipeline {

  environment {
    registry = "jonesthomas/first-node-app"
    dockerimagename = "jonesthomas/first-node-app"
    dockerImage = ""
  }

  agent any

  stages {

    stage('Checkout Source') {
      steps {
        git branch: 'master', credentialsId: 'Ramya-Jenkins', url: 'git@github.com:Jones-Thomas/python-flask-docker.git'
      }
    }

    stage('Build image') {
      steps{
        script {
          dockerImage = docker.build dockerimagename
        }
      }
    }

    stage('Pushing Image') {
      environment {
               registryCredential = 'jones-dockerhub'
           }
      steps{
        script {
        docker.withRegistry( '', registryCredential ) {
        dockerImage.push("${env.BUILD_NUMBER}")
            }
        }
      }
    }

    // stage('Deploy') {
    //   steps {
            
    //         sh "pwd"
    //   }
    // }
    stage('Cleaning up') {
        steps{
            sh "docker rmi $dockerimagename"
        }
    }
  }
}