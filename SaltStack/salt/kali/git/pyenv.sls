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
{{state_id}}//{{f}}.config_init:
  file.blockreplace:
    - name: {{f}}
    - marker_start: "## BEGIN saltstack modified config: <pyenv> -DO-NOT-EDIT- --"
    - marker_end: "## END saltstack modified config: <pyenv> -DO-NOT-EDIT- --"
    - append_if_not_found: True
    - show_changes: True
    - backup: .salt.bkup

{{state_id}}//{{f}}.config_content:
  file.accumulated:
    - name: {{state_id}}//{{f}}.config_content
    - filename: {{f}}
    - text: |
          export PYENV_ROOT="/KaliNG/.pyenv"
          export PATH="$PYENV_ROOT/bin:$PATH"
          eval "$(pyenv init --path)"
    - require_in:
      - file: {{state_id}}//{{f}}.config_init
{% endfor %}

{% for f in ['/root/.zshrc'] %}
{{state_id}}//{{f}}.config_init:
  file.blockreplace:
    - name: {{f}}
    - marker_start: "## BEGIN saltstack modified config: <pyenv> -DO-NOT-EDIT- --"
    - marker_end: "## END saltstack modified config: <pyenv> -DO-NOT-EDIT- --"
    - append_if_not_found: True
    - show_changes: True
    - backup: .salt.bkup

{{state_id}}//{{f}}.config_content:
  file.accumulated:
    - name: {{state_id}}//{{f}}.config_content
    - filename: {{f}}
    - text: |
          eval "$(pyenv init -)"
    - require_in:
      - file: {{state_id}}//{{f}}.config_init
{% endfor %}
