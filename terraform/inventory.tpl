[db]
%{ for ip in db_external_ip ~}
${ip}
%{ endfor ~}

[backend]
%{ for ip in backend_external_ip ~}
${ip}
%{ endfor ~}

[nginx]
%{ for ip in nginx_external_ip ~}
${ip}
%{ endfor ~}

[iscsi]
%{ for ip in iscsi_external_ip ~}
${ip}
%{ endfor ~}

