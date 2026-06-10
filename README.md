# Actividad 3. 

## Despliegue de una aplicación mediante máquinas virtuales y AWS dentro del proyecto transversal de la empresa Fintech Solutions S. A.

### Local

#### Run local machine

```
vagrant up
```


### AWS

#### Create AWS AMI

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

#### Create AWS Instance

This README was generated automatically.
