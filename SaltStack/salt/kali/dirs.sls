{% set state_id = "kali@dirs.sls" %}

{{state_id}}//kaliNG-root:
  file.directory:
    - name: /kaliNG/
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

{{state_id}}//kaliNG-git:
  file.directory:
    - name: /kaliNG/git/
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

{{state_id}}//kaliNG-pyenv-repo:
  file.directory:
    - name: /kaliNG/git/pyenv
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

{{state_id}}//kaliNG-pyenv-sym:
  file.symlink:
    - name: /kaliNG/.pyenv
    - target: /kaliNG/git/pyenv
    - user: root
    - group: root
    - mode: 755
    - makedirs: True
