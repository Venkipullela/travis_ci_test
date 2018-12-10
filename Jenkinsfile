void setBuildStatus(String message, String state) {
  step([
      $class: "GitHubCommitStatusSetter",
      reposSource: [$class: "ManuallyEnteredRepositorySource", url: "https://github.com/my-org/my-repo"],
      contextSource: [$class: "ManuallyEnteredCommitContextSource", context: "ci/jenkins/build-status"],
      errorHandlers: [[$class: "ChangingBuildStatusErrorHandler", result: "UNSTABLE"]],
      statusResultSource: [ $class: "ConditionalStatusResultSource", results: [[$class: "AnyBuildResult", message: message, state: state]] ]
  ]);
}

pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                sh '''#!/bin/bash
                     echo "hello world"
                     cd /home/ubuntu/auto-test/travis_ci_test
                    rustup default nightly-2018-09-06-x86_64-unknown-linux-gnu
                    git reset --hard HEAD
                    git checkout $GITHUB_PR_SOURCE_BRANCH
                    git pull origin $GITHUB_PR_SOURCE_BRANCH
                    cargo run
                '''
            }
        }
    }
    post {
        success {
            setBuildStatus("Build succeeded", "SUCCESS");
        }
        failure {
            setBuildStatus("Build failed", "FAILURE");
        }
      }
}
