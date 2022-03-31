{% set state_id = "kali@configure-games.sls" %}
{% set src = "/kaliNG/git/linux-utils/unified-shell/skel" %}

{{state_id}}//cows:
  rsync.synchronized:
    - name: /usr/share/cowsay/
    - source: {{src}}/usr/share/cowsay/
    - delete: True

{{state_id}}//kaliNG-git:
  file.directory:
    - name: /usr/share/games/fortunes
    - source: {{src}}/usr/share/games/fortunes
    - delete: False
