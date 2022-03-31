{% set state_id = "kali@configure-games.sls" %}
{% set src = "/kaliNG/git/linux-utils/unified-shell/skel" %}
{% set cows_dir = "/usr/share/cowsay/" %}
{% set fortune_dir = "/usr/share/games/fortunes" %}

{{state_id}}//cows:
  rsync.synchronized:
    - name: "{{cows_dir}}"
    - source: "{{src}}{{cows_dir}}"
    - delete: True

{{state_id}}//fortunes:
  rsync.synchronized:
    - name: "{{fortune_dir}}"
    - source: "{{src}}{{fortune_dir}}"
    - delete: False

{% for f in ['zippy', 'zippy.dat', 'zippy.u8'] %}
{{state_id}}//remove-{{f}}:
  file.absent:
    - name: "{{fortune_dir}}/{{f}}"
{% endfor %}
