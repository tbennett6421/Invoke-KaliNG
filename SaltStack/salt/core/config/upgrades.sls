{% set state_id = "core@config/upgrades.sls" %}
# https://docs.saltproject.io/en/latest/ref/states/all/salt.states.module.html
# https://docs.saltproject.io/en/latest/ref/modules/all/salt.modules.aptpkg.html

{{state_id}}//apt-get-update:
  module.run:
    - name: pkg.refresh_db

{{state_id}}//apt-get-upgrade:
  module.run:
    - name: pkg.upgrade

{{state_id}}//apt-get-distupgrade:
  module.run:
    - name: pkg.upgrade
      dist_upgrade: True

{{state_id}}//apt-get-autoremove:
  module.run:
    - name: pkg.autoremove
