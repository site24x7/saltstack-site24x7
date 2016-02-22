site24x7-uninstall:
  cmd.run:
    - name: sudo ./{{ pillar['site24x7']['installfile']['fileName'] }} -u
#    - cwd: /root
#    - unless: [ ! -d /opt/site24x7/monagent/bin ]