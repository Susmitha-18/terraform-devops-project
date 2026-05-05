pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'ap-south-1'
    }

    stages {

        stage('Terraform Init') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'aws-creds',
                    usernameVariable: 'AWS_ACCESS_KEY_ID',
                    passwordVariable: 'AWS_SECRET_ACCESS_KEY'
                )]) {

                    bat '"C:\\ProgramData\\chocolatey\\bin\\bin\\terraform.exe" init'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'aws-creds',
                    usernameVariable: 'AWS_ACCESS_KEY_ID',
                    passwordVariable: 'AWS_SECRET_ACCESS_KEY'
                )]) {

                    bat '"C:\\ProgramData\\chocolatey\\bin\\bin\\terraform.exe" validate'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'aws-creds',
                    usernameVariable: 'AWS_ACCESS_KEY_ID',
                    passwordVariable: 'AWS_SECRET_ACCESS_KEY'
                )]) {

                    bat '"C:\\ProgramData\\chocolatey\\bin\\bin\\terraform.exe" plan'
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'aws-creds',
                    usernameVariable: 'AWS_ACCESS_KEY_ID',
                    passwordVariable: 'AWS_SECRET_ACCESS_KEY'
                )]) {

                    bat '"C:\\ProgramData\\chocolatey\\bin\\bin\\terraform.exe" apply -auto-approve'
                }
            }
        }
    }
}