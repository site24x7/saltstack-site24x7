site24x7:
  user:
    fullname: ABC
    apikey: SITE24X7APIKEY
    proxy: None
    osArch: {{ grains['cpuarch'] }}
  installfile:
    {% if grains['cpuarch'] == 'x86_64' %}
    fileName: Site24x7_Linux_64bit.install 
    {% elif grains['cpuarch'] == 'x86_32' %}
    fileName: Site24x7_Linux_32bit.install
    {% endif %}