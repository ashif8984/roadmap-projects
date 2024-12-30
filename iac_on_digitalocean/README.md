## IaC on DigitalOcean
Write Terraform code to create a Droplet on DigitalOcean


Sample solution for [IaC on DigitalOcean](https://roadmap.sh/projects/iac-digitalocean)\
This project is part of [roadmap.sh](https://roadmap.sh/projects) DevOps projects.


### Steps to provision VM instance on GCP Cloud via Terraform IaC

The goal for this project is to configure and create a terraform code to create a droplet on Digital Ocean. But this demo we will be usig Google Cloud instead and run a terraform code to create VM instance on GCP.

**What we will be doing..**

1. Setup terraform locally and create a tf files for GCP resource
2. Create a resource for provisioning VM instance on GCP using terraform.
3. Run the terraform code
4. Verify the VM created
5. Finally, delete the resource / vm

**Clone the repository**

```sh
git clone https://github.com/ashif8984/roadmap-projects.git
cd iac_on_digitalocean
```


✅ **Prepare the TF files**

In order to create resources on GCP via terraform lets prepare our folder structure and create the necessary files

1. Create 3 files namely - 

main.tf – containing the resource blocks that define the resources to be created in the target cloud platform.
provider.tf – containing the terraform block, s3 backend definition, provider configurations, and aliases.

We can additionally add more files like output.tf, variables.tf, tf.vars.json files but lets keep it simple


```sh
# main.tf
resource "google_compute_instance" "default" {
  provider = google
  name = "my-test-vm"
  machine_type = "e2-micro"
  network_interface {
    network = "default"
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-focal-v20220712"
    }
  }
  allow_stopping_for_update = true
}
```

```sh
# provider.tf
provider "google" {
  project     = "loyal-curve-256919"
  region      = "us-central1"
  zone        = "us-central1-c"
  credentials = file("key.json")
}
```

✅ **Create and download the key.json file from GCP Console**

1. Goto IAM and Admin and click on service account
2. Select your Service account and click on keys
3. Click on 'Add Key' and create new key, select json
4. Key will be download to your computer
5. Copy entire content on json key downloaded
6. Create a new file key.json at the root of the terraform current folder and copy the content copied



✅ **Run the terraform**

2. You only need to run the below command to create the resource - a VM instance

```sh
terraform init
terraform plan
terraform apply -auto-approve
```

✅ **Validate the resources**

1. Goto the GCP console and goto Compute Engine
2. You will see a resource (a VM instance) with name - "my-test-vm" created
3. If you get any error (I was stuck for hours 😕) while running terraform commands refer to the link below - Errors

PS: I was stuck with error that says as below. My terraform plan would run but not the terraform apply.

**Error**:

> (gcloud.container.clusters.create) ResponseError: code=403, message=Google Compute Engine: Required 'compute.zones.get' permission for 'projects/loyal-curve-256919/zones/us-central-1c'

**Solution**:

I deleted my existing service account and recreated the service account with a new name from the console. This fixed my issue. I have only given the "Editor" role to the service account.


🔗 References

[Online reference for GCP via terraform](https://mihaibojin.medium.com/deploy-and-configure-google-compute-engine-vms-with-terraform-f6b708b226c1) \
[Errors](https://stackoverflow.com/questions/48232189/google-compute-engine-required-compute-zones-get-permission-error) 
