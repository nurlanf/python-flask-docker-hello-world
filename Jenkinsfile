/**
 * This pipeline will run a Docker image build

def label = "docker-${UUID.randomUUID().toString()}"

podTemplate(label: label, yaml: """
apiVersion: v1
kind: Pod
spec:
  containers:
  - name: docker
    image: docker:1.11
    command: ['cat']
    tty: true
    volumeMounts:
    - name: dockersock
      mountPath: /var/run/docker.sock
  volumes:
  - name: dockersock
    hostPath:
      path: /var/run/docker.sock
"""

  ) */


  def label = "docker"
  def image = "nurlanfarajov/hello-flask"
  node(label) {
    stage('Build Docker image and Publish') {
      git 'https://github.com/nurlanf/python-flask-docker-hello-world.git'
      container('docker') {
        sh "docker build -t ${image} ."
      }
    }
    }
   node(label) {
     stage('Publish') {
        withDockerRegistry([ credentialsId: "dockerhub", url: "" ]) {
          container('docker'){
          sh 'docker push ${image}'
          }
      }
     }
   }
