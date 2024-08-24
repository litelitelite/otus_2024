---
nginx:
  pkg:
    - installed
  service:
    - running
    - reload: True
    - require:
      - pkg: nginx
  file.managed:
    - name: /etc/nginx/nginx.conf
    - source: salt://nginx/nginx.conf
    - watch_in:
      - service: nginx
  iptables.append:
    - table: filter
    - family: ipv4
    - chain: INPUT
    - jump: ACCEPT
    - dports:
      - 3001
      - 4505 
      - 4506
    - protocol: tcp
    - save: True