node('master') {
    stage('Preparation') { 
      checkout([$class: 'GitSCM', branches: [[name: '*/ready/**']], 
      doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'CleanBeforeCheckout'], 
      pretestedIntegration(gitIntegrationStrategy: accumulated(), integrationBranch: 'master', 
      repoName: 'origin')], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'anna0207', 
      url: 'git@github.com:SuneJepsen/ca-project.git']]])
      stash name: "repo", includes: "**", useDefaultExcludes: false
    }
}

node('ubuntu'){
    stage('Build'){
      unstash 'repo'
      sh 'docker build -t pythonapp .'
    }

    stage('Test'){
      if (isUnix()) {
         sh 'docker run -i pythonapp python /usr/src/app/tests.py'
       //sh "mvn -Dmaven.test.failure.ignore clean package"
      
      }
    }

    stage('Push'){
      pretestedIntegrationPublisher()
      deleteDir()
    }

    stage('Result'){
      archiveArtifacts "run.py" 
    }
}


