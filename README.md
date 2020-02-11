# DOCKER-JENKINS-ANSIBLE

Ansible fit for jenkins pipeline

# How To Use

Jenkinsfile:

```
pipeline {
  agent {
    docker {
      image 'honomoa/ansible'
    }
  }
  stages {
    stage('Clone scm') {
      steps {
        checkout([$class: 'GitSCM', branches: [[name: '*/master']],
          userRemoteConfigs: [[url: 'http://git-server/user/repository.git']]])
      }
    }
    stage('Run Ansible') {
      steps {
        sh 'ansible --version'
        sh 'ansible-galaxy --version'
        sh 'ansible-playbook --version'
      }
    }
  }
}
```
