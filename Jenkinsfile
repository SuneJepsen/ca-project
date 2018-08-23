node {
  //cleanWs()

    stage('Preparation') { // for display purposes
        // Get some code from a GitHub repository

    checkout([$class: 'GitSCM', branches: [[name: '*/ready/**']], 
    doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'CleanBeforeCheckout'], 
    pretestedIntegration(gitIntegrationStrategy: accumulated(), integrationBranch: 'master', 
    repoName: 'origin')], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'anna0207', 
    url: 'git@github.com:SuneJepsen/ca-project.git']]])
    
    stash name: "repo", includes: "**", useDefaultExcludes: false
    }

    stage('Push'){
        pretestedIntegrationPublisher()

        deleteDir()
    }
  }


