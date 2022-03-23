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
