{% set state_id = "core@config/configurations.sls" %}

{{state_id}}//kaliNG-git:
  file.directory:
    - name: /kaliNG/.tmux/
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

{{state_id}}//tmux-conf:
  file.managed:
    - name: /kaliNG/.tmux.conf
    - source: salt://files/kaliNG/tmux.conf
    - source_hash: sha1=df3343fe6e1c54db9ab0cdb327daf69ca9a4f9e1

{{state_id}}//vim-conf:
  file.managed:
    - name: /kaliNG/.vimrc
    - source: salt://files/kaliNG/vimrc
    - source_hash: sha1=5f809db9580d5c1e658f0418b3dd434862c5651e

{{state_id}}//git-tmux-tpm:
  git.cloned:
    - name: https://github.com/tmux-plugins/tpm
    - target: /root/.tmux/plugins/tpm
