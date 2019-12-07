pipeline {
    agent any
    
    environment {
        ARM_SUBSCRIPTION_ID      = "98e03152-0027-41fa-a4af-1b6b1100e212"
        ARM_TENANT_ID            = credentials('Terraform-Azure-Tenant_ID')
        ARM_CLIENT_ID            = credentials('Terraform-Azure-Client_ID')
        ARM_CLIENT_SECRET        = credentials('Terraform-Azure-Client-Secret')
        ARM_STATE_CONTAINER_NAME = "terraform-state-test1"
    }
    
    stages {
        stage ("terra-create-state-container") {
            steps {
                script {
                    createTerraformStorageContainer()
                }
            }
        }
        stage ('terra-init'){
            steps {
                 bat "\"${getTerraformPath()}\\terraform\" init"               
            }
        }
        stage ('terra-plan') {
            steps {
                bat "\"${getTerraformPath()}\\terraform\" plan"
            }
        }  
        stage ('terra-apply') {
            steps {
                bat "\"${getTerraformPath()}\\terraform\" apply -auto-approve" 
            }
        } 
    }
}

def getTerraformPath () {
    def HomeDir = tool name: 'Terraform-12', type: 'org.jenkinsci.plugins.terraform.TerraformInstallation'
    return HomeDir
}

def createTerraformStorageContainer () {
    withCredentials([string(credentialsId: 'Terraform-Azure-StorageAccount-Key', variable: 'ACCOUNT_KEY')]) {
        bat "az storage container create -n %ARM_STATE_CONTAINER_NAME% --account-name terraformstorageacount01 --account-key %ACCOUNT_KEY%"
    }
}