node {

    stage('Preparation') {
	// Get code from Github repository 
       checkout scm
    }

    stage(‘Build’) {
	//Run the python build
	sh “python run.py”
    }

    stage(‘Test’) {
	sh ‘python /usr/src/tests.py’
    }

    stage(‘Result’) {
        archiveArtifacts "target/**/*"
    }
}


