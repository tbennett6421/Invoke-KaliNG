{% set state_id = "kali@pip.sls" %}

{% for p in ['beautifulsoup4','colorama','cookiecutter','impacket','pycrypto','pypykatz','requests'] %}
{{state_id}}//pip3-install-{{p}}:
  pip.installed:
    - name: {{p}}
    - cwd: '/kaliNG/.pyenv/shims/'
    - bin_env: '/kaliNG/.pyenv/shims/pip3'
{% endfor %}
