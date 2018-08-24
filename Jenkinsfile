node {
    cleanWs()
    stage('Preparation') {
        checkout([$class: 'GitSCM', branches: [[name: '*/ready/**']], 
        doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'CleanBeforeCheckout'], 
        pretestedIntegration(gitIntegrationStrategy: accumulated(), integrationBranch: 'master', 
        repoName: 'origin')], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'anna0207', 
        url: 'git@github.com:SuneJepsen/ca-project.git']]])
        stash name: "repo", includes: "**", useDefaultExcludes: false
    }
    
    stage('Build'){
        sh 'docker build -t kongsune/pythonapp .'
    }
    
    stage('Test'){
      if (isUnix()) {
         sh 'docker run -i kongsune/pythonapp python /usr/src/app/tests.py'
      }
    }
}

node('ubuntu-test'){
    cleanWs()    
    stage('Push'){
        unstash "repo"
        pretestedIntegrationPublisher()
        sh 'docker push kongsune/pythonapp'
    }
    
    stage('Result'){
        archiveArtifacts '**/run.py'
    }
    
    stage('Deploy'){
        sh 'docker container stop pythonapp'
        sh 'docker run --name pythonapp --rm -p 80:5000 -d kongsune/pythonapp'
    }
}


