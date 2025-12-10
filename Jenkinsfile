pipeline{
    agent any
    parameters {
        booleanParam(name: 'SKIP_TESTS', defaultValue: false, description: 'Skip test stages')
        choice(name: 'ENV', choices: ['dev','prod'], description: 'Deployment environment')
    }
    stages{
        stage('Initialization'){
            steps{
                echo "Deploying to ${params.ENV}... Skip Tests: ${params.SKIP_TESTS}"
            }
        }
        stage('my-stage'){
            steps{
                sh 'echo "Starting  engines..."'
                sh 'docker --version'
            }
        }
    }
}