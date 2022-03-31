{% set state_id = "core@config/configurations.sls" %}
{% set ZCUST_DIR = '/root/.my_zsh_custom' %}
{% set ZCUST_LP = '/root/.my_zsh_custom/loading_point.zsh' %}

{{state_id}}//kaliNG-git:
  file.directory:
    - name: /kaliNG/.tmux/
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

{{state_id}}//tmux-conf:
  file.managed:
    - name: /root/.tmux.conf
    - source: salt://files/kaliNG/tmux.conf
    - source_hash: sha1=3f41533225304540981d2536e82bb66e0120186d

{{state_id}}//vim-conf:
  file.managed:
    - name: /root/.vimrc
    - source: salt://files/kaliNG/vimrc
    - source_hash: sha1=5f809db9580d5c1e658f0418b3dd434862c5651e

{{state_id}}//git-tmux-tpm:
  git.cloned:
    - name: https://github.com/tmux-plugins/tpm
    - target: /root/.tmux/plugins/tpm

{{state_id}}//zsh-custom-dir:
  file.directory:
    - name: {{ZCUST_DIR}}
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

{% for f in ['/root/.zshrc'] %}
{{state_id}}//{{f}}.config_init:
  file.blockreplace:
    - name: {{f}}
    - marker_start: "## BEGIN saltstack modified config: <my_zshrc> -DO-NOT-EDIT- --"
    - marker_end: "## END saltstack modified config: <my_zshrc> -DO-NOT-EDIT- --"
    - append_if_not_found: True
    - show_changes: True
    - backup: .salt.bkup

{{state_id}}//{{f}}.config_content:
  file.accumulated:
    - name: {{state_id}}//{{f}}.config_content
    - filename: {{f}}
    - text: |
          [[ ! -f {{ZCUST_LP}} ]] || source {{ZCUST_LP}}
    - require_in:
      - file: {{state_id}}//{{f}}.config_init
{% endfor %}

{{state_id}}//zsh_aliases:
  file.managed:
    - name: "{{ZCUST_DIR}}/.my_sh_aliases"
    - source: salt://files/kaliNG/my_sh_aliases
    - source_hash: sha1=314e61b48b9b18abe1b219f3444475778a0554f1

{{state_id}}//zsh_env:
  file.managed:
    - name: "{{ZCUST_DIR}}/.my_sh_env"
    - source: salt://files/kaliNG/my_sh_env
    - source_hash: sha1=795f02804296483225fc6584069383930afb31ac

{{state_id}}//zsh_functions:
  file.managed:
    - name: "{{ZCUST_DIR}}/.my_sh_functions"
    - source: salt://files/kaliNG/my_sh_functions
    - source_hash: sha1=7651d9db1536204655f7113a8abf0e8567897b40

{{state_id}}//zsh_prompt:
  file.managed:
    - name: "{{ZCUST_DIR}}/.my_sh_prompt"
    - source: salt://files/kaliNG/my_sh_prompt
    - source_hash: sha1=5f915841b5b187d679de9a004da2e11057c98678
