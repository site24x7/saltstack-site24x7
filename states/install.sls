{% if not salt['file.directory_exists' ]('/opt/site24x7/monagent/bin') %}
download-agent:
  file.managed:
    - name: /tmp/{{ pillar['site24x7']['installfile']['fileName'] }}
    - source: https://staticdownloads.site24x7.com/server/{{ pillar['site24x7']['installfile']['fileName'] }}
    - mode: o0755
    - skip_verify: True

install-agent:
  cmd.run:
    {% if pillar['site24x7']['user']['proxy'] == 'None' %}
    - name: /bin/sh /tmp/{{ pillar['site24x7']['installfile']['fileName'] }} -i -key={{ pillar['site24x7']['user']['devicekey'] }} -installer=saltstack -f
    {% else %}
    - name: /bin/sh /tmp/{{ pillar['site24x7']['installfile']['fileName'] }} -i -key={{ pillar['site24x7']['user']['devicekey'] }} -installer=saltstack -proxy={{ pillar['site24x7']['user']['proxy'] }} -f
    {% endif %}
{% endif %}

cleanup-install:
  file.absent:
    - name: /tmp/{{ pillar['site24x7']['installfile']['fileName'] }}
