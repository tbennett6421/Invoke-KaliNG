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
