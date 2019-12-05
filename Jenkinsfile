pipeline {
    agent any
    
    environment {
        PATH = "${PATH}:${getTerraformPath()}"
    }
    
    stages {
        stage ('terra-init'){
            steps {
                echo '1 - %Path%'
                echo '2 - $PATH'
                echp '3 - ${PATH}'
                bat "terraform init"
            }
        }    
    }
}

def getTerraformPath () {
    def HomeDir = tool name: 'Terraform-12', type: 'org.jenkinsci.plugins.terraform.TerraformInstallation'
    return HomeDir
}
