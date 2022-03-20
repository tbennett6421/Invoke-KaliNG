{% set state_id = "core@config/ssh/sshd.sls" %}

# sshd -t
# echo $?
#   0 on success
#   255 on failure

# We need sshd -t to work, fix [Missing privilege separation directory: /run/sshd]
# create the directory if missing and restart sshd
{{state_id}}//dir-sshd-bugfix:
  file.directory:
    - name: /var/run/sshd
    - user: root
    - group: root
    - mode: 755
    - makedirs: True

# Ensure this is fixed on boot
# https://askubuntu.com/questions/1109934/ssh-server-stops-working-after-reboot-caused-by-missing-var-run-sshd/1110843#1110843
{{state_id}}//cron-sshd-bugfix:
  cron.present:
    - name: mkdir -p -m0755 /var/run/sshd && systemctl restart ssh.service
    - user: root
    - special: '@reboot'
    - comment: 'On reboot: Ensure priviledge seperation directory exists'
    - identifier: "bugfix--sshd-priviledge-seperation-dir"

# Regenerate SSH-Keys at least once
{{state_id}}//regen-ssh-keys:
  cmd.run:
    - name: rm -fv /etc/ssh/ssh_host_* && dpkg-reconfigure openssh-server && touch /etc/salt/.salt-token-sshkeys-purged
    - creates: /etc/salt/.salt-token-sshkeys-purged

## Start and enable ssh service, watch for changes
{{state_id}}//sshd_service:
  service.running:
    - name: ssh
    - enable: True
    - onlyif:
      - sshd -t
    - watch:
      - file: {{state_id}}//dir-sshd-bugfix
      - cmd: {{state_id}}//regen-ssh-keys
