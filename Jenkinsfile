node {

    stage('Preparation') { 
       checkout scm
    }

    stage(‘Build’) {
	sh “python run.py”
    }

    stage(‘Test’) {
	sh ‘python /usr/src/tests.py’
    }

    stage(‘Result’) {
        archiveArtifacts "target/**/*"
    }
}


