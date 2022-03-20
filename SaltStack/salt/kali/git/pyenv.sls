{% set state_id = "kali@git/pyenv.sls" %}

{{state_id}}//git-pyenv:
  git.cloned:
    - name: git@github.com:pyenv/pyenv.git
    - target: /kaliNG/git/pyenv
    - user: root
