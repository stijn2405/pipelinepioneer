pipeline {
  environment {
    registryCredential = 'ce4d704c-1c87-4c84-b56e-f58dd0ac0737'
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
          docker.build("knakkergithub/proftaakdocker:release_$BUILD_NUMBER", "/home/ladmin/pipelinepioneer/kubecode")
        }
      }
    }
    stage('Push to DockerHub Registry') {
      steps{
        script {
          docker.withRegistry('https://registry.hub.docker.com', registryCredential) {
            docker.image("knakkergithub/proftaakdocker:release_$BUILD_NUMBER").push()
          }
        }
      }
    }
  }
}
