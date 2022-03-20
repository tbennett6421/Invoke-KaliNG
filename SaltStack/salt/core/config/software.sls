{% set state_id = "core@config/software.sls" %}

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

{{state_id}}//build-tools.packages:
  pkg.installed:
    - pkgs:
      - autoconf
      - build-essential
      - gcc
      - gcc-multilib
      - gcc-mingw-w64-i686
      - make
      - wine
      - python2-dev
      - python3-dev
