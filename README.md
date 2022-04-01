### Generate private key using openssl. You will be prompted for passphrase.

```shell
$ openssl genrsa -des3 -out postgres_certs/server.key 1024
```
### Remove passphrase.
```shell
$ openssl rsa -in postgres_certs/server.key -out postgres_certs/server.key
```

### Update the file permission and ownership of private key file.
```shell
$ chmod 640 postgres_certs/server.key
```
### Similarly, create server certificate.
```shell
$ openssl req -new -key postgres_certs/server.key -days 3650 -out postgres_certs/server.crt -x509
```

## 
```shell
$ docker-compose run --rm iac init
```