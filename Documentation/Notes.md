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

## Kali-NG related

### Creating directory structure
```sh
mkdir -p /kaliNG/git/
```

## Installation of third party software

### pyenv
```sh
git clone https://github.com/pyenv/pyenv.git /kaliNG/git/pyenv
git clone https://github.com/pyenv/pyenv-virtualenv.git /kaliNG/git/pyenv/plugins/pyenv-virtualenv
ln -s /kaliNG/git/pyenv /kaliNG/.pyenv
```

Add the following to `/root/.zprofile` and `/root/.profile`
```
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_ROOT="/kaliNG/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
```

Add the following to `/root/.zshrc`
```
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
export PYENV_ROOT="/kaliNG/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
```

Install python2 and python3 outside of system
```sh
pyenv install 2.7.18
pyenv install 3.9.10
pyenv virtualenv 2.7.18 kali-py2
pyenv virtualenv 3.9.10 kali-py3
pyenv global kali-py3 kali-py2
```

### pip bundles
```sh
pip3 install beautifulsoup4 colorama cookiecutter impacket pycrypto pypykatz requests
```

### powerlevel10k
```sh
git clone https://github.com/romkatv/powerlevel10k.git /kaliNG/git/powerlevel10k
wget https://raw.githubusercontent.com/tbennett6421/Invoke-KaliNG/master/SaltStack/salt/files/kaliNG/p10k.zsh -O /kaliNG/.p10k.zsh
```

Add the following to your zshrc
```
source /kaliNG/git/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f /kaliNG/.p10k.zsh ]] || source /kaliNG/.p10k.zsh
```

### rlwrap
```sh
git clone https://github.com/hanslub42/rlwrap.git /kaliNG/git/rlwrap
cd /kaliNG/git/rlwrap && autoreconf --install && ./configure && make
ln -s /kaliNG/git/rlwrap/src/rlwrap /usr/local/bin/rlwrap
```

### nfsshell
```sh
git clone https://github.com/tbennett6421/nfsshell.git /kaliNG/git/nfsshell
cd /kaliNG/git/nfsshell && make clean && make
ln -s /kaliNG/git/nfsshell/nfsshell /usr/local/bin/nfsshell
```
