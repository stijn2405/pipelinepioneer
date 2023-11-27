pipeline {
  environment {
    imagename = "knakkergithub/proftaakdocker"
    registryCredential = 'da38a0fc-248c-44b9-825d-88f3f012151a'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git([url: 'https://github.com/stijn2405/pipelinepioneer', branch: 'main', credentialsId: '9e195a33-40db-452c-83ec-ce3fec020047'])
 
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build imagename
          dockerImage
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push("$BUILD_NUMBER")
             dockerImage.push('latest')
          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $imagename:$BUILD_NUMBER"
         sh "docker rmi $imagename:latest"
 
      }
    }
  }
}
