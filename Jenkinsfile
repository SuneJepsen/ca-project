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
	sh ‘tox -e py27’
    }

    stage(‘Result’) {
        archiveArtifacts "target/**/*"
    }
}


