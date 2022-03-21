{% set state_id = "kali@git/nfsshell.sls" %}

{{state_id}}//git-nfsshell:
  git.cloned:
    - name: https://github.com/tbennett6421/nfsshell.git
    - target: /kaliNG/git/nfsshell
    - user: root

{{state_id}}//make:
  cmd.run:
    - name: cd /kaliNG/git/nfsshell && make clean && make
    - creates: /kaliNG/git/nfsshell/nfsshell

{{state_id}}//install:
  file.symlink:
    - name: /usr/local/bin/nfsshell
    - target: /kaliNG/git/nfsshell/nfsshell
    - user: root
    - group: root
    - mode: 555
