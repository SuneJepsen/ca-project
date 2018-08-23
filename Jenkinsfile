node {
  //cleanWs()

    stage('Preparation') { // for display purposes
        // Get some code from a GitHub repository

    checkout([$class: 'GitSCM', branches: [[name: '*/ready/**']], 
    doGenerateSubmoduleConfigurations: false, extensions: [[$class: 'CleanBeforeCheckout'], 
    pretestedIntegration(gitIntegrationStrategy: accumulated(), integrationBranch: 'master', 
    repoName: 'origin')], submoduleCfg: [], userRemoteConfigs: [[credentialsId: 'anna0207', 
    url: 'git@github.com:SuneJepsen/ca-project.git']]])
    
  //  stash name: "repo", includes: "**", useDefaultExcludes: false
    }

 state('Build'){
   sh 'docker build -t pythonapp .'
 }

 stage('Test'){
       if (isUnix()) {
            sh 'docker run -i pythonapp python /usr/src/app/tests.py'
            //sh "mvn -Dmaven.test.failure.ignore clean package"
    //        stash name: "build-result", includes: "target/**"

        }
   }
    stage('Push'){
        pretestedIntegrationPublisher()

        deleteDir()
    }
  }


