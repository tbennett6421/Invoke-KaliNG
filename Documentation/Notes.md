## Everything is this file is considered to be run using superuser!

## OS Operations
### Updates
```sh
apt-get update
apt-get upgrade -y
apt-get dist-upgrade -y
apt-get autoremove -y
```

### User/Groups
```sh
getent group PublicKeyOnly || groupadd PublicKeyOnly
getent group SftpOnly || groupadd SftpOnly
```
