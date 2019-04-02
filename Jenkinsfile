def image = "nurlanfarajov/hello-flask:${BUILD_NUMBER}"

pipeline {
  agent {
    kubernetes {
      label 'docker'
      yamlFile 'k8s/docker-pod.yml'
    }
  }
  stages {
    stage('Build') {
      steps {
        container('docker') {
          sh 'docker build -t ${image} .'
        }
      }
    }
  }
}