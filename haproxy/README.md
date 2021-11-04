# HAproxy Kubernetes Ingress With Terraform

Terraform to install HAproxy kubernetes ingress.

## Usage

### Configuration 

- cd into haproxy directory
- Set the following values in `variables.tf` to point to your kube config and kube context
    ```tf
        variable "config_path" {
            type            = string
            description     = "Path to kube config"
            default         = "<your config path>"
        }

        variable "config_context" {
            type            = string
            description     = "Kubernetes context to use"
            default         = "<context name>"
        }
    ```
- Alternatively you can set configuration for `kubernetes` and `helm` providers under `provider.tf` based on the following documentation as per your requirement:
  - https://registry.terraform.io/providers/hashicorp/helm/2.3.0/docs
  - https://registry.terraform.io/providers/hashicorp/kubernetes/2.6.1/docs
  - **You may need to remove the above two variable configuration based on your requirement**
  
### Setting Service Type

- You can change the service type of the ingress controller by changing the `service_type` key in `variables.tf` - defaults to type `LoadBalancer`

### Running

Run the following commands:

- Initialize

```shell
    terraform init    
```

- To view the plan

```shell
    terraform plan    
```

- To apply the changes

```shell
    terraform apply # Optionally you can pass --auto-approve to skip approval    
```

### Clean up

- To destroy the changes

```shell
    terraform destroy # Optionally you can pass --auto-approve to skip approval    
```

## More information
- See https://github.com/haproxy-ingress/charts/tree/release-0.13/haproxy-ingress