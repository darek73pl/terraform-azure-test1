pipeline {
    agent any
    
    environment {
        PATH = "${PATH}:${getTerraformPath()}"
    }
    
    stages {
        stage ('terra-init'){
            steps {
                bat "az login --service-principal -u \"56734769-eb5d-4ef2-9f3e-63be21d88528\" -p \"rYqBPiW8Fo:O/?dA.nciejC8JC8J51X4\" -t \"1c65a708-c899-485d-ad68-d53560fa74ba\""
                bat "\"${getTerraformPath()}\\terraform\" init"
                bat "\"${getTerraformPath()}\\terraform\" plan"
                bat "\"${getTerraformPath()}\\terraform\" apply -auto-approve"
            }
        }    
    }
}

def getTerraformPath () {
    def HomeDir = tool name: 'Terraform-12', type: 'org.jenkinsci.plugins.terraform.TerraformInstallation'
    return HomeDir
}
