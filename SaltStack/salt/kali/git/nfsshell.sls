{% set state_id = "kali@git/nfsshell.sls" %}

{{state_id}}//git-nfsshell:
  git.cloned:
    - name: https://github.com/tbennett6421/nfsshell.git
    - target: /kaliNG/git/nfsshell
    - user: root
