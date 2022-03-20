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

{% for f in ['/root/.zprofile','/root/.profile'] %}
{{state_id}}//{{f}}_pyenv-root:
  file.line:
    - name: {{f}}
    - content: export PYENV_ROOT="/KaliNG/.pyenv"
    - mode: insert
    - location: end
    - backup: True
    - quiet: True
{{state_id}}//{{f}}_pyenv-pathedit:
  file.line:
    - name: {{f}}
    - content: export PATH="$PYENV_ROOT/bin:$PATH"
    - mode: insert
    - location: end
    - backup: True
    - quiet: True
{{state_id}}//{{f}}_pyenv-init:
  file.line:
    - name: {{f}}
    - content: eval "$(pyenv init --path)"
    - mode: insert
    - location: end
    - backup: True
    - quiet: True
{% endfor %}
