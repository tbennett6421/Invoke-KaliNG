{% set state_id = "kali@git/rlwrap.sls" %}

{{state_id}}//git-rlwrap:
  git.cloned:
    - name: https://github.com/hanslub42/rlwrap.git
    - target: /kaliNG/git/rlwrap
    - user: root