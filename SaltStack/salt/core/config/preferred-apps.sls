{% set state_id = "core@config/preferred-apps.sls" %}

{{state_id}}//terminal:
  file.replace:
    - name: '/etc/xdg/xfce4/helpers.rc'
    - pattern: 'TerminalEmulator=.*'
    - repl: 'TerminalEmulator=gnome-terminal'
    - show_changes: true
    - backup: .salt.bkup
