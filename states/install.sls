{% if not salt['file.directory_exists' ]('/opt/site24x7/monagent/bin') %}
download-agent:
  cmd.run:
    - name: sudo wget -r https://staticdownloads.site24x7.com/server/{{ pillar['site24x7']['installfile']['fileName'] }}
    - user: root

chmod-agent:
  cmd.run:
    - name: chmod 755 {{ pillar['site24x7']['installfile']['fileName'] }}
    - user: root

install-agent:
  cmd.run:
    {% if pillar['site24x7']['user']['proxy'] == 'None' %}
    - name: sudo ./{{ pillar['site24x7']['installfile']['fileName'] }} -i -key={{ pillar['site24x7']['user']['devicekey'] }} -f
    {% else %}
    - name: sudo ./{{ pillar['site24x7']['installfile']['fileName'] }} -i -key={{ pillar['site24x7']['user']['devicekey'] }} -proxy={{ pillar['site24x7']['user']['proxy'] }} -f
    {% endif %}
    - user: root
{% endif %}
