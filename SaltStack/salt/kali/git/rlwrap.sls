{% set state_id = "kali@git/rlwrap.sls" %}

{{state_id}}//git-rlwrap:
  git.cloned:
    - name: https://github.com/hanslub42/rlwrap.git
    - target: /kaliNG/git/rlwrap
    - user: root

{{state_id}}//autoconf:
  cmd.run:
    - name: cd /kaliNG/git/rlwrap && autoreconf --install
    - creates: /kaliNG/git/rlwrap/configure

{{state_id}}//configure:
  cmd.run:
    - name: cd /kaliNG/git/rlwrap/ && ./configure
    - creates: /kaliNG/git/rlwrap/Makefile

{{state_id}}//make:
  cmd.run:
    - name: cd /kaliNG/git/rlwrap/ && make
    - creates: /kaliNG/git/rlwrap/src/rlwrap

{{state_id}}//install:
  file.symlink:
    - name: /usr/local/bin/rlwrap
    - target: /kaliNG/git/rlwrap/src/rlwrap
    - user: root
    - group: root
    - mode: 555
