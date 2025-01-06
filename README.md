
# Déploiement d'un Site Statique sur AWS avec Terraform et Docker

Ce projet configure une infrastructure AWS pour héberger un site statique via un bucket S3. Il inclut également un environnement Docker pour exécuter Terraform, un fichier Makefile pour simplifier le déploiement et une page HTML statique.

## Prérequis

Avant de commencer, assurez-vous d'avoir :
**Compte AWS** avec les permissions nécessaires pour gérer S3,et IAM.
Étapes d'installation et de déploiement : 
## 1. Cloner le dépôt
 ```bash
git clone https://github.com/Firas-Bha/Static-Website-Deployment-AWS.git
cd Static-Website-Deployment-AWS
  ```
## 2. Configurer les variables
- Modifiez le fichier terraform/variables.tf pour y inclure les valeurs nécessaires :
Nom du bucket S3 ( Le nom doit être unique ) et Région AWS.
- Placez vos credentials AWS dans un fichier .env au format suivant : .env ( pour raison de sécurité mon fichier .env n'est pas inclut )
- Pour générer les access ids ajouter un IAM USER qui a les permissions nécessaires et après vous vous pouvez générer uns access id.
```bash
AWS_ACCESS_KEY_ID=<votre_access_key>
AWS_SECRET_ACCESS_KEY=<votre_secret_key>
```
## Configuration de l'infrastructure avec Dockerfile
```bash
docker run --rm -v $(pwd):/terraform terraform-docker init
docker run --rm -v $(pwd):/terraform terraform-docker plan
docker run --rm -v $(pwd):/terraform terraform-docker apply
```


## Configuration de l'infrastructure avec Docker-compose
```bash
```docker-compose run  terraform init
```docker-compose run  terraform plan
```docker-compose run  terraform apply
```


## Configuration de l'infrastructure avec Makefile 

1. Construire l'environnement Docker
```bash
make build
```
2. Initialiser Terraform
```bash
make init
```
3. Planifier l'infrastructure
Générez un plan pour vérifier les changements qui seront appliqués :
```bash
make plan
```
4. Appliquer l'infrastructure
Déployez l'infrastructure sur AWS :
```bash
make apply
```

  
