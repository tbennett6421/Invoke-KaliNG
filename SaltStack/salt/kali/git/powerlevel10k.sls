{% set state_id = "kali@git/powerlevel10k.sls" %}

{{state_id}}//git-powerlevel10k:
  git.cloned:
    - name: https://github.com/romkatv/powerlevel10k.git
    - target: /kaliNG/git/powerlevel10k
    - user: root

{% for f in ['/root/.zshrc'] %}
{{state_id}}//{{f}}.config_init:
  file.blockreplace:
    - name: {{f}}
    - marker_start: "## BEGIN saltstack modified config: <p10k> -DO-NOT-EDIT- --"
    - marker_end: "## END saltstack modified config: <p10k> -DO-NOT-EDIT- --"
    - append_if_not_found: True
    - show_changes: True
    - backup: .salt.bkup

{{state_id}}//{{f}}.config_content:
  file.accumulated:
    - name: {{state_id}}//{{f}}.config_content
    - filename: {{f}}
    - text: |
          source /kaliNG/git/powerlevel10k/powerlevel10k.zsh-theme
          # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
          [[ ! -f /root/.p10k.zsh ]] || source /root/.p10k.zsh
    - require_in:
      - file: {{state_id}}//{{f}}.config_init
{% endfor %}

{{state_id}}//p10k.zsh:
  file.managed:
    - name: /root/.p10k.zsh
    - source: salt://files/kaliNG/p10k.zsh
    - source_hash: sha1=c92044854947c5109a60675e569e366f82867d0b
