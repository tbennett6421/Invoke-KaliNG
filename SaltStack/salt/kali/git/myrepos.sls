{% set state_id = "kali@git/myrepos.sls" %}

{{state_id}}//git-snare:
  git.cloned:
    - name: https://github.com/tbennett6421/snare.git
    - target: /kaliNG/git/snare
    - user: root

{{state_id}}//git-snare-ng:
  git.cloned:
    - name: https://github.com/tbennett6421/snare-ng.git
    - target: /kaliNG/git/snare-ng
    - user: root

{{state_id}}//git-linux-utils:
  git.cloned:
    - name: https://github.com/tbennett6421/linux-utils.git
    - target: /kaliNG/git/linux-utils
    - user: root
