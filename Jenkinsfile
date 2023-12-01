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
          sh "docker build -t testimage:latest pipelinepioneer/kubecode"
        }
      }
    }
    stage('Push to DockerHub Registry') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push("$BUILD_NUMBER")
             dockerImage.push('latest')
          }
        }
      }
    }
  }
}
