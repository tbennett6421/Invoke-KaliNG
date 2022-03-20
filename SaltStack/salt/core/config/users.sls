{% set state_id = "core@config/users.sls" %}
# python3 -c 'import crypt,getpass; print(crypt.crypt(getpass.getpass(), crypt.mksalt(crypt.METHOD_SHA512)))'
# https://docs.saltproject.io/en/latest/ref/states/all/salt.states.group.html

# Create groups for publickeyonly and sftponly
{% for g in ['PublicKeyOnly','SftpOnly'] %}
{{state_id}}//{{g}}_group:
  group.present:
    - name: {{g}}
{% endfor %}
