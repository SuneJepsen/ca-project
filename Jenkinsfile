node('master') {
    stage('Preparation') { 
        checkout([$class: 'GitSCM', branches: [[name: '*/ready/**']], 
        doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'CleanBeforeCheckout'], 
        pretestedIntegration(gitIntegrationStrategy: accumulated(), integrationBranch: 'master', 
        repoName: 'origin')], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'anna0207', 
        url: 'git@github.com:SuneJepsen/ca-project.git']]])
        stash name: "repo", includes: "**", useDefaultExcludes: false
    }
    stage('Test'){
      if (isUnix()) {
         sh 'docker run -i kongsune/pythonapp python /usr/src/app/tests.py'
      }
    }
}

node('ubuntu'){
    stage('Result'){
        ws {
            unstash "repo"
            archiveArtifacts '**/run.py' 
        }
    }
    
    stage('Push'){
        pretestedIntegrationPublisher()
        sh 'docker build -t kongsune/pythonapp .'
        sh 'docker push kongsune/pythonapp'
        deleteDir()
    }
}


