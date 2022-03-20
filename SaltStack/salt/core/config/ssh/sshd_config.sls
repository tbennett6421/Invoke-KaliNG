{% set state_id = "core@config/ssh/sshd_config.sls" %}

{{state_id}}//sftp_subsystem:
  file.replace:
    - name: '/etc/ssh/sshd_config'
    - pattern: '.*Subsystem.*sftp.*'
    - repl: 'Subsystem sftp internal-sftp -f AUTH -l VERBOSE'
    - show_changes: true
    - backup: .salt.bkup

{{state_id}}//authorized_keys:
  file.uncomment:
    - name: '/etc/ssh/sshd_config'
    - regex: 'AuthorizedKeysFile'

## Manage sshd config dynamically with accumulator
{{state_id}}//sshd.config_managed:
  file.managed:
    - name: /etc/ssh/sshd_config
    - user: root
    - group: root
    - mode: 644

{{state_id}}//sshd.config_init:
  file.blockreplace:
    - name: /etc/ssh/sshd_config
    - marker_start: "## BEGIN saltstack managed config -DO-NOT-EDIT- --"
    - marker_end: "## END saltstack managed config -DO-NOT-EDIT --"
    - append_if_not_found: True
    - show_changes: True
    - backup: .salt.bkup

{{state_id}}//sshd.config_content:
  file.accumulated:
    - name: {{state_id}}//sshd.config_content
    - filename: /etc/ssh/sshd_config
    - text: |
          Match group SftpOnly
              ChrootDirectory %h
              ForceCommand internal-sftp
              AllowTcpForwarding no

          Match Group PublicKeyOnly
              PasswordAuthentication no

    - require_in:
      - file: {{state_id}}//sshd.config_init

## Start and enable ssh service, watch for changes
{{state_id}}//sshd_service:
  service.running:
    - name: ssh
    - enable: True
    - onlyif:
      - sshd -t
    - watch:
      - file: {{state_id}}//sftp_subsystem
      - file: {{state_id}}//authorized_keys
      - file: {{state_id}}//sshd.config_init
