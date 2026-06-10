# Actividad 3. 

## Despliegue de una aplicación mediante máquinas virtuales y AWS dentro del proyecto transversal de la empresa Fintech Solutions S. A.

---
### Local

#### Run local machine

```
vagrant up
```


---
### AWS

#### Create AWS AMI with Packer

Descargar librerias Packer
```
packer init .
```

Validar estructura con packer
```
packer validate .
```

Construir ami en AWS
```
packer build .
```


#### Create AWS Instance with Terraform

Init Terraform
```
terraform init
```

Build terraform plan
```
terraform plan
```

Deploy resources
```
terraform apply
```


---
### Scripts automatizados


#### Crear recursos en AWS
Generar todos los recursos PAcker y Terraform

Ejecutar en PowerShell:
```
./deploy-resources.sp1
```


#### Eliminar recursos de AWS

Ejecutar en PowerShell
```
./delete-resources.sp1
```


