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