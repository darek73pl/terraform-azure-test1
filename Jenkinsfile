pipeline {
    agent any
    
    environment {
        PATH = "${PATH}:${getTerraformPath()}"
    }
    
    stages {
        stage ('terra-init'){
            steps {
                echo '%Path%'
                bat "terraform init"
            }
        }    
    }
}

def getTerraformPath () {
    def HomeDir = tool name: 'Terraform-12', type: 'org.jenkinsci.plugins.terraform.TerraformInstallation'
    return HomeDir
}
