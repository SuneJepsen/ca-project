node {

    stage ('Preparation'){
	// Get code from Github repository 
  git credentialsId: ‘anna0207’, url: 'git@github.com:SuneJepsen/ca-project.git’
    }

    stage (‘Build’){
	//Run the python build
	sh “python run.py”
    }

    stage(‘Test’){
	sh ‘tox -e py27’
    }

    stage(‘Result’) {
        archiveArtifacts "target/**/*"
    }
}


