### Generate private key using openssl. You will be prompted for passphrase.

```shell
openssl genrsa -des3 -out postgres_certs/server.key 1024
```
### Remove passphrase.
```shell
openssl rsa -in postgres_certs/server.key -out postgres_certs/server.key
```

### Update the file permission and ownership of private key file.
```shell
chmod 640 postgres_certs/server.key
```
### Similarly, create server certificate.
```shell
openssl req -new -key postgres_certs/server.key -days 3650 -out postgres_certs/server.crt -x509
```

# Initialize terraform.
- this command will take a while for it will try to startup the postgresql container first.
## 
```shell
docker-compose run --rm iac init
```
# Vew & Apply terraform infrastructure.
```shell
docker-compose run --rm iac plan
docker-compose run --rm iac apply --auto-approve
```
## To rebuild and only start the postgresql container.
```shell
docker-compose up --build -d terraform_backend
```
## View riunning contaienrs.
```
docker ps --format "table {{.Names}}\t{{.Mounts}}\t{{.Ports}}\t{{.Image}}"
```

## Destroy terraform infrastructure.
```
docker-compose run --rm iac destroy --auto-approve
```

# References:
- https://www.postgresql.org/docs/9.5/ssl-tcp.html
- https://ubiq.co/database-blog/how-to-enable-ssl-in-postgresql/
- https://superuser.com/questions/556493/permissions-for-ssl-key
- https://www.terraform.io/language/settings/backends/pg
- https://learn.hashicorp.com/tutorials/terraform/docker-build?in=terraform/docker-get-started