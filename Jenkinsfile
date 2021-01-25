def pipelineContext = [:]
node {
    def registryProject='registry.gitlab.com/younes-amine/jenkins'
    def IMAGE="${registryProject}:version-${env.BUILD_ID}"
    
    stage('Clone'){
        git branch: 'main', url: 'https://github.com/younesAmin/build-docker-with-jenkins.git'
    }
    
    def img = stage('Build'){
        docker.build("$IMAGE", '.')
    }
    
    stage('Run'){
        img.withRun("--name run-$BUILD_ID -p 80:80") { c ->
            sh 'curl localhost'
        }
    }
    
    stage('Push'){
        docker.withRegistry('https://registry.gitlab.com','regi1'){
            img.push 'latest'
            img.push()
        }
    }
}
