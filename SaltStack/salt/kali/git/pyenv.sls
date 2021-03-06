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
          export PYENV_VIRTUALENV_DISABLE_PROMPT=1
          export PYENV_ROOT="/kaliNG/.pyenv"
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
          export PYENV_VIRTUALENV_DISABLE_PROMPT=1
          export PYENV_ROOT="/kaliNG/.pyenv"
          export PATH="$PYENV_ROOT/bin:$PATH"
          eval "$(pyenv init --path)"
          eval "$(pyenv init -)"
          eval "$(pyenv virtualenv-init -)"
    - require_in:
      - file: {{state_id}}//{{f}}.config_init
{% endfor %}

{{state_id}}//git-pyenv-virtualenv:
  git.cloned:
    - name: https://github.com/pyenv/pyenv-virtualenv.git
    - target: /kaliNG/git/pyenv/plugins/pyenv-virtualenv
    - user: root

{{state_id}}//git-pyenv-python2.7.18:
  cmd.run:
    - name: pyenv install 2.7.18
    - creates: /kaliNG/.pyenv/versions/2.7.18

{{state_id}}//git-pyenv-python3.9.10:
  cmd.run:
    - name: pyenv install 3.9.10
    - creates: /kaliNG/.pyenv/versions/3.9.10

{{state_id}}//git-pyenv-python2-venv:
  cmd.run:
    - name: pyenv virtualenv 2.7.18 kali-py2
    - creates: /kaliNG/.pyenv/versions/kali-py2

{{state_id}}//git-pyenv-python3-venv:
  cmd.run:
    - name: pyenv virtualenv 3.9.10 kali-py3
    - creates: /kaliNG/.pyenv/versions/kali-py3

# set global python2 and python3 using our new venvs
{{state_id}}//git-pyenv-set-global:
  cmd.run:
    - name: pyenv global kali-py3 kali-py2 && touch /etc/salt/.salt-token-pyenv-global-set
    - creates: /etc/salt/.salt-token-pyenv-global-set
