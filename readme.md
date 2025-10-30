> Terraform Bootstrap <br><br/>
✅ Creates an S3 bucket to store your Terraform state file <br><br/>
✅ Creates a DynamoDB table for state locking

<br><br/>

```
terraform -chdir=01-backend-bootstrap init
```
```
terraform -chdir=01-backend-bootstrap plan
```
```
terraform -chdir=01-backend-bootstrap apply -auto-approve
```


<br><br/>
<br><br/>
> Configure Terraform backend (linking to S3 + DynamoDB) - where to store and lock the state. <br><br/>
✅ Configures Terraform to provision a EC2 instance <br><br/>
✅ Configures Terraform to use them as a remote backend

<br><br/>

```
terraform -chdir=ece-provision-01-simple init
```
```
terraform -chdir=ece-provision-01-simple plan
```
```
terraform -chdir=ece-provision-01-simple apply  -auto-approve
```

```
terraform -chdir=ece-provision-01-simple destroy
```
