node('master') {
    stage('Preparation') { 
        checkout([$class: 'GitSCM', branches: [[name: '*/ready/**']], 
        doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'CleanBeforeCheckout'], 
        pretestedIntegration(gitIntegrationStrategy: accumulated(), integrationBranch: 'master', 
        repoName: 'origin')], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'anna0207', 
        url: 'git@github.com:SuneJepsen/ca-project.git']]])
        stash name: "repo", includes: "**", useDefaultExcludes: false
    }
    stage('Build'){
        sh 'docker build -t pythonapp .'
    }

    stage('Test'){
      if (isUnix()) {
         sh 'docker run -i pythonapp python /usr/src/app/tests.py'
         stash name: "build-result", includes: "target/**"
      }
    }
}

node('ubuntu'){
    stage('Result'){
        unstash 'repo'
        unstash 'build-result'
        archiveArtifacts 'target/*.py' 
    }
    
    stage('Push'){
        pretestedIntegrationPublisher()
        deleteDir()
    }

}


