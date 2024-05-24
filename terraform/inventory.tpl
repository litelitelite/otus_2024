[gfs2]
%{ for ip in gfs2_external_ip ~}
${ip}
%{ endfor ~}

[gfs2-master]
%{ for ip in gfs2_master_external_ip ~}
${ip}
%{ endfor ~}
