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
  ) {

  def image = "nurlanfarajov/hello-flask:${BUILD_NUMBER}"
  node(label) {
    stage('Build Docker image') {
      git 'https://github.com/nurlanf/hello-flask.git'
      container('docker') {
        sh "docker build -t ${image} ."
      }
    }
  }
}
