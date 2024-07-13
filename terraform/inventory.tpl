[nginx]
%{ for ip in ansible_nginx_ip ~}
${ip}
%{ endfor ~}

[db]
%{ for ip in ansible_db_ip ~}
${ip}
%{ endfor ~}

[app]
%{ for ip in ansible_app_ip ~}
${ip}
%{ endfor ~}

[elk]
%{ for ip in ansible_elk_ip ~}
${ip}
%{ endfor ~}

[web:children]
nginx
app 

[db:children]
db 

[elk:children]
elk