# Nupur-MBIRN-assesment

Created Azure Storage Account for tf State file.
Created Service Principal.
Created Github Repository.
Created GitHub Action Workflow file.
Created Terraform files.
Pushed Git Repository.
Tracked Github Action Workflow



STEPS -

 

1. Setup Repository:

   - Create a new GitHub repository.

 

2. Terraform Initialization:

- Create a `main.tf`, `variables.tf`, and `outputs.tf` file.

   - Initialize Terraform with `terraform init`.

 

3. Azure Provider Configuration:

- In `main.tf`, configure the Azure provider.

 

4. Virtual Machine Creation:

- Define the necessary resources for the virtual machine in the free tier, including a network interface, public IP, and virtual machine configuration in `main.tf`.

   - Ensure you set the SSH inbound rule to your public IP address.

 

5. Azure Key Vault Configuration:

- Create and configure an Azure Key Vault resource in `key.tf`.

   - Store secrets (admin user and password) in the Azure Key Vault.
    # Create a secret for the admin username
az keyvault secret set --vault-name YourKeyVaultName --name "AdminUsername" --value "your-admin-username"

# Create a secret for the admin password
az keyvault secret set --vault-name YourKeyVaultName --name "AdminPassword" --value "your-admin-password"

 

6. Remote State Configuration:

   - Configure Terraform to use Azure Storage Account for remote state management.

 

7. Virtual Machine Automation Script:

- Create a `install_docker_helm.sh` script to be executed on the virtual machine's first boot.

   - The script should install Docker and Helm.

 

8. Deploy Helm Application:

- Within the `app.tf` script, use Helm to deploy the specified GitHub repository.

 HELM applcation : https://github.com/codefresh-contrib/helm-sample-app

 Used aks and Helm module from module folders

9. GitHub Actions Configuration:

   - Create a `.github/workflows/githubactions_azure_terraform.yml` file.

   - Setup GitHub Actions to install Terraform.

   - Setup GitHub Actions to retrieve secrets from Azure Key Vault.

   - Execute `terraform init`, `terraform plan`, and `terraform apply` commands.

   - Ensure the action uses a service principal with permissions to deploy resources to Azure and access the Key Vault.

 

10. Test & Document:

- Ensure all configurations and scripts are documented in the repository's `README.md`.

   - Even if you can't deploy, mention the steps to run and test the setup, and note any areas where you might have uncertainties.

 

11. Repository Cleanup & Finalization:

   - Check all files for sensitive data and ensure they are not hard-coded.

   - Commit all changes to the GitHub repository.

   - Push the repository to GitHub.

 

12. Share Repository:

   - Ensure the GitHub repository is public.

   - Share the repository URL as per the task's requirements.