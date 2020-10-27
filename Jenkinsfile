pipeline {
    agent {
        docker {
            image 'python'
        }
    }

    stages {
        stage('Build') {
            steps {
                echo 'Compilando ou resolvendo as dependencias do projeto'
                sh 'pip install robotframework'
            }
        }
        stage('Tests') {
            steps {
                echo 'Executando testes de regressão'
                sh 'robot -d ./log -e todo tests/'
            }
        }
        stage('UAT') {
            steps {
                echo 'Aguardando testes de aceitação do usuário.'
                input(message: 'Go To Production?', ok: 'Yes')
            }
        }
        stage('Production') {
            steps {
                echo 'App is Ready :)'
            }
        }
    }    
}
