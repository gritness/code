#!/bin/bash

# httpd install 
yum install httpd -y
systemctl enable httpd.service
systemctl start httpd.service

# java install
yum install java-1.8.0-openjdk-devel -y

# telnet install
yum install telnet -y

# wget install
yum install -y wget

# folders config
mkdir /var/log/seven && mkdir /opt/seven && mkdir /etc/seven && mkdir /etc/httpd/conf/vhosts/ && mkdir /etc/wildfly/ && mkdir /opt/wildfly
chmod -R 777 /var/log/seven && chmod -R 777 /opt/seven && chmod -R 777 /etc/seven && chmod -R 777 /etc/httpd/conf/vhosts/ && chmod -R 777 /etc/wildfly/ && chmod -R 777 /opt/wildfly

# wildfly install
groupadd -r wildfly
useradd -r -g wildfly -d /opt/wildfly -s /sbin/nologin wildfly
wget -P / https://cf-templates-8ck1lkjy15q-us-east-1.s3.amazonaws.com/wildfly.zip 
chmod -R 777 wildfly.zip
unzip -d /opt/wildfly/ wildfly.zip
cp /opt/wildfly/docs/contrib/scripts/systemd/wildfly.conf /etc/wildfly/
cp /opt/wildfly/docs/contrib/scripts/systemd/launch.sh /opt/wildfly/bin/
cp /opt/wildfly/docs/contrib/scripts/systemd/wildfly.service /etc/systemd/system/
chmod -R 777 /opt/wildfly/bin/*.*
chown -RH wildfly: /opt/wildfly
systemctl daemon-reload 
systemctl enable wildfly
systemctl start wildfly

# zabbix agent install
yum install libcrypto.so.1.1 libssl.so.1.1 -y
rpm -ivh https://repo.zabbix.com/zabbix/5.4/rhel/8/x86_64/zabbix-agent-5.4.5-1.el8.x86_64.rpm
yum install zabbix-agent -y
cd /etc/zabbix/zabbix_agentd.d
curl https://raw.githubusercontent.com/catonrug/zabbix_agentd.d/master/service_monitoring_via_systemctl.conf > service_monitoring_via_systemctl.conf
## config
yes | rm /etc/zabbix/zabbix_agentd.conf
vim /etc/zabbix/zabbix_agentd.conf
a
PidFile=/run/zabbix/zabbix_agentd.pid
LogFile=/var/log/zabbix/zabbix-agent.log
LogFileSize=100
LogRemoteCommands=0
Server=coletor03.ipsense.com.br,35.174.134.49,10.100.10.76
ServerActive=coletor03.ipsense.com.br,10.100.10.76
Hostname=SEVEN-ONIPAY-prod_onipay_bo_wildfly_01 # <---- ajustar conforme padrao
HostMetadata=Linux      RD7LTgQsqJCdbnetdzhKqmzNXtL3N4PtCa3c36Am7GKQ9JqCJP
Include=/etc/zabbix/zabbix_agentd.d/
Timeout=8
## enable/start
systemctl enable zabbix-agent.service
systemctl start zabbix-agent.service

# pgbouncer install
yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum -y install pgbouncer
## config
yes | rm /etc/pgbouncer/pgbouncer.ini
vim /etc/pgbouncer/pgbouncer.ini
a
[databases]
* = host=[server] port=5432

[pgbouncer]
logfile = /var/log/pgbouncer/pgbouncer.log
pidfile = /var/run/pgbouncer/pgbouncer.pid
listen_addr = *
listen_port = 5430
auth_type = trust
auth_file = /etc/pgbouncer/userlist.txt
admin_users = postgres
stats_users = stats, postgres
pool_mode = transaction
server_reset_query = DISCARD ALL
server_reset_query_always = 1
ignore_startup_parameters = extra_float_digits
max_client_conn = 200
default_pool_size = 20
#log_connections = 0
## enable/start
systemctl enable pgbouncer.service
systemctl start pgbouncer.service
