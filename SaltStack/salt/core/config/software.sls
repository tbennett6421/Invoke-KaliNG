{% set state_id = "core@config/software.sls" %}

{{state_id}}//fun.packages:
  pkg.installed:
    - pkgs:
      - fortune-mod
      - fortune-off
      - fortunes-bofh-excuses
      - cowsay
      - lolcat

{{state_id}}//net.packages:
  pkg.installed:
    - pkgs:
      - git
      - curl
      - wget
      - netcat-traditional
      - tcpdump
      - iptables

{{state_id}}//server.packages:
  pkg.installed:
    - pkgs:
      - openssh-server
      - nfs-common
      - anacron

{{state_id}}//core.packages:
  pkg.installed:
    - pkgs:
      - rsync
      - screen
      - tmux
      - rhash
      - dos2unix
      - htop
      - pv
      - vim
      - mlocate

{{state_id}}//gui.packages:
  pkg.installed:
    - pkgs:
      - eog
      - code-oss
      - gnome-terminal

{{state_id}}//build-tools.packages:
  pkg.installed:
    - pkgs:
      - autoconf
      - build-essential
      - gcc
      - gcc-multilib
      - gcc-mingw-w64-i686
      - libssl-dev
      - libbz2-dev
      - libreadline-dev
      - libsqlite3-dev
      - llvm
      - libncursesw5-dev
      - libxml2-dev
      - libxmlsec1-dev
      - libffi-dev
      - liblzma-dev
      - make
      - python2-dev
      - python3-dev
      - python3-pip
      - tk-dev
      - wine
      - xz-utils
      - zlib1g-dev
