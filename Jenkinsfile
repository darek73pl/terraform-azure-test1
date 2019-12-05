pipeline {
    agent any
    
    environment {
        PATH = "${PATH}:${getTerraformPath()}"
    }
    
    stages {
        stage ('terra-init'){
            steps {
                bat "set ARM_CLIENT_ID=\"56734769-eb5d-4ef2-9f3e-63be21d88528\""
                bat "set ARM_CLIENT_SECRET=\"rYqBPiW8Fo:O/?dA.nciejC8JC8J51X4\""
                bat "set ARM_SUBSCRIPTION_ID=\"98e03152-0027-41fa-a4af-1b6b1100e212\""
                bat "set ARM_TENANT_ID=\"1c65a708-c899-485d-ad68-d53560fa74ba\""
                bat "az login --service-principal -u \"56734769-eb5d-4ef2-9f3e-63be21d88528\" -p \"rYqBPiW8Fo:O/?dA.nciejC8JC8J51X4\" -t \"1c65a708-c899-485d-ad68-d53560fa74ba\""
                bat "\"${getTerraformPath()}\\terraform\" init"
            }
        }    
    }
}

def getTerraformPath () {
    def HomeDir = tool name: 'Terraform-12', type: 'org.jenkinsci.plugins.terraform.TerraformInstallation'
    return HomeDir
}
