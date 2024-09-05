pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {                
                git branch: 'main', url: 'https://github.com/fv-rui/CDAProjet.git'
            }
        }
        stage('Contrôle qualité') {
            steps {
                sh '''
                    sonar-scanner \
                      -Dsonar.projectKey=$sonarqube_project \
                      -Dsonar.sources=. \
                      -Dsonar.host.url=http://$sonarqube:9000 \
                      -Dsonar.token=$sonarqube_token
                '''
            }
        }
    }
}
