pipeline {
  environment {
    imagename = "knakkergithub/proftaakdocker"
    registry = "knakkergithub/proftaakdocker"
    registryCredential = 'ce4d704c-1c87-4c84-b56e-f58dd0ac0737'
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
          sh "docker build -t knakkergithub/proftaakdocker /home/ladmin/pipelinepioneer/kubecode"
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
