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

### Installation of software packages

#### Net packages
```sh
apt-get install -y git curl wget netcat-traditional tcpdump iptables
```

#### Server packages
```sh
apt-get install -y openssh-server nfs-common anacron
```

#### Core packages
```sh
apt-get install -y rsync screen tmux rhash dos2unix htop pv vim mlocate
```

#### GUI packages
```sh
apt-get install -y eog code-oss
```

#### Build-Tool packages
```sh
apt-get install -y autoconf build-essential gcc gcc-multilib gcc-mingw-w64-i686 libssl-dev libbz2-dev libreadline-dev libsqlite3-dev llvm libncursesw5-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev make python2-dev python3-dev tk-dev wine xz-utils zlib1g-dev
```

### Configuration of sshd.config
@todo document this

Documentation may be incomplete... read the code

#### Regen SSH keys
```sh
rm -fv /etc/ssh/ssh_host_*
dpkg-reconfigure openssh-server
```

#### Enable/Start SSHD
```sh
systemctl enable ssh
systemctl start ssh
```
