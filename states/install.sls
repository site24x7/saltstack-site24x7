{% if not salt['file.directory_exists' ]('/opt/site24x7/monagent/bin') %}
download-agent:
  cmd.run:
    - name: sudo wget https://staticdownloads.site24x7.com/server/{{ pillar['site24x7']['installfile']['fileName'] }}
    - user: root

chmod-agent:
  cmd.run:
    - name: chmod 755 {{ pillar['site24x7']['installfile']['fileName'] }}
    - user: root

install-agent:
  cmd.run:
    {% if pillar['site24x7']['user']['proxy'] == 'None' %}
    - name: sudo ./{{ pillar['site24x7']['installfile']['fileName'] }} -i -key={{ pillar['site24x7']['user']['devicekey'] }} -installer=saltstack -f
    {% else %}
    - name: sudo ./{{ pillar['site24x7']['installfile']['fileName'] }} -i -key={{ pillar['site24x7']['user']['devicekey'] }} -installer=saltstack -proxy={{ pillar['site24x7']['user']['proxy'] }} -f
    {% endif %}
    - user: root
{% else %}
cleanup-install:
  file.absent:
    - name: ~/{{ pillar['site24x7']['installfile']['fileName'] }}
{% endif %}
