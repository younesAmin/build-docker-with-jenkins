node{
  def app

    stage('clone'){
      checkout scm
    }

    stage('Build image'){
	app = docker.build("amine/nginx")
    }

    stage('Run image'){
	docker.image("amine/nginx").withRun('-p 80:80'){ c ->
	sh 'docker ps'
	sh 'curl localhost'
	}
    }
}
