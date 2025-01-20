# AWS S3 Bucket Setup for Static Website

This repository contains Terraform code to create an AWS S3 bucket configured for hosting a static website. It also includes configuration for setting up public access controls, bucket ownership, and static files (index and error pages).

## Resources Created
- **S3 Bucket**: Creates an S3 bucket with the name specified by the `bucket_name` variable.
- **Bucket Ownership Controls**: Configures object ownership to be preferred by the bucket owner.
- **Public Access Block**: Configures public access block settings to allow public access.
- **Bucket ACL**: Sets the bucket's ACL to `public-read` to allow public access to the files.
- **Static Website**: Configures the bucket to serve an `index.html` as the home page and `error.html` for errors.
- **Static Files**: Uploads the following static files to the S3 bucket:
  - `index.html`
  - `error.html`
  - `styles.css`

## Prerequisites
- [Terraform](https://www.terraform.io/downloads) (version 1.x or higher) installed.
- An AWS account with appropriate permissions to create S3 buckets and configure them.
- AWS credentials configured using `aws configure` or through environment variables.

## Files in the Repository
- **`main.tf`**: Contains the Terraform configuration for creating the S3 bucket, setting access controls, and uploading static files.
- **`index.html`**: The main HTML file for the static website.
- **`error.html`**: The HTML file displayed when there’s an error.
- **`styles.css`**: The CSS file for styling the static website.
- **`README.md`**: This file, providing instructions for the project.

## Usage

### 1. Clone the Repository
First, clone the repository to your local machine:
git clone https://github.com/your-username/your-repository.git
cd your-repository

### 2. Configure the AWS Provider
Ensure your AWS credentials are configured. You can either set them up via the AWS CLI or use environment variables.

To configure via AWS CLI:
aws configure

Alternatively, you can export AWS credentials as environment variables:
export AWS_ACCESS_KEY_ID="your-access-key"
export AWS_SECRET_ACCESS_KEY="your-secret-key"
export AWS_DEFAULT_REGION="your-region"

### 3. Modify the `bucket_name` Variable (if necessary)
In `main.tf`, you can either edit the `bucket_name` directly or set it via a `terraform.tfvars` file or environment variable.

Example in `main.tf`:
variable "bucket_name" {
  description = "The name of the S3 bucket"
  default     = "my-static-website-bucket"
}

### 4. Initialize Terraform
Run the following command to initialize the Terraform configuration and download the necessary provider plugins:
terraform init

### 5. Apply the Configuration
Run the following command to apply the Terraform configuration and create the resources:
terraform apply
Terraform will prompt you to confirm before applying the changes. Type `yes` to proceed.

### 6. Access the Static Website
Once the resources are created, the S3 bucket will be configured to host a static website. You can access it using the S3 bucket’s website URL. After running `terraform apply`, Terraform will output the URL of the static website.

For example:
Output:
S3 Website URL: http://my-static-website-bucket.s3-website-us-east-1.amazonaws.com

Visit the provided URL in your browser to see your static website in action.

## Cleanup

To destroy the resources and remove the created infrastructure, run:
terraform destroy
Terraform will prompt you to confirm. Type `yes` to destroy the resources.

## License
This project is licensed under the MIT License - see the LICENSE file for details.
