{% set state_id = "kali@git/pyenv.sls" %}

{{state_id}}//git-pyenv:
  git.cloned:
    - name: https://github.com/pyenv/pyenv.git
    - target: /kaliNG/git/pyenv
    - user: root

{{state_id}}//kaliNG-pyenv-sym:
  file.symlink:
    - name: /kaliNG/.pyenv
    - target: /kaliNG/git/pyenv
    - user: root
    - group: root
    - mode: 755
    - makedirs: True
