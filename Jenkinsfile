def label = "docker-${UUID.randomUUID().toString()}"

podTemplate(label: label, yaml: """
apiVersion: v1
kind: Pod
metadata:
  labels:
    jenkins/kube-default: true
    app: jenkins
    component: agent
spec:
  containers:
    - name: jnlp-slave
      image: jenkins/jnlp-slave:3.27-1
      resources:
        limits:
          cpu: 1
          memory: 2Gi
        requests:
          cpu: 1
          memory: 2Gi
      imagePullPolicy: Always
      env:
      - name: POD_IP
        valueFrom:
          fieldRef:
            fieldPath: status.podIP
      - name: DOCKER_HOST
        value: tcp://localhost:2375
    - name: dind
      image: docker:18.05-dind
      securityContext:
        privileged: true
      volumeMounts:
        - name: dind-storage
          mountPath: /var/lib/docker
  volumes:
    - name: dind-storage
      emptyDir: {}
"""
  ) {

  def image = "nurlanfarajov/hello-flask"
  node(label) {
    stage('Build Docker image') {
      git 'https://github.com/nurlanf/python-flask-docker-hello-world.git'
      container('docker') {
        sh "docker build -t ${image}:${BUILD_NUMBER} ."
        sh "docker ${image}:${BUILD_NUMBER} ${image}:latest tag "
      }
    }
  }
}
