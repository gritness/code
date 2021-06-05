# !/bin/sh
# Bkp arquivos de instalação e configuração.
# v1.0
# by Rickey Chaman
# 06/2021

echo "Copia Gateway_Service"
cp /etc/init.d/mmt-gateway-service /home/mmt/deploy/gateway_service/etc/init.d/
cp /etc/seven/service-gateway-bank.yaml /home/mmt/deploy/gateway_service/etc/seven
yes | cp -R /opt/seven/mmt-gateway-service /home/mmt/deploy/gateway_service/opt/seven/

echo "Copia ISO_Socket"
cp /etc/init.d/mm-interfaceexternal-socket-iso8583 /home/mmt/deploy/iso_socket/etc/init.d/
cp /etc/seven/mm-interfaceexternal-socket-iso8583.config.xml /home/mmt/deploy/iso_socket/etc/seven/
yes | cp -R /opt/seven/mm-interfaceexternal-socket-iso8583 /home/mmt/deploy/iso_socket/opt/seven/

echo "Copia API_V2"
cp /etc/seven/MMTOnlineAcquire.config.xml /home/mmt/deploy/api_v2/etc/seven
cp /opt/wildfly/standalone/deployments/EzSuiteOnlineAcquire.war /home/mmt/deploy/api_v2/opt/wildfly/standalone/deployments/

echo "Copia Background_Services"
cp /etc/init.d/mm-backgroundservices-mmtonlinegty /home/mmt/deploy/background_services/etc/init.d/
cp /etc/seven/mm-backgroundservices-mmtonlinegty.config.xml /home/mmt/deploy/background_services/etc/seven
yes | cp -R /opt/seven/mm-backgroundservices-mmtonlinegty /home/mmt/deploy/background_services/opt/seven/

echo "Copia Batch_Embossing"
cp /etc/init.d/mm-interfaceexternal-batch-embossing /home/mmt/deploy/batch_proxy/etc/init.d/
cp /etc/seven/mm-interfaceexternal-batch-embossing.config.xml /home/mmt/deploy/batch_proxy/etc/seven/
yes | cp -R /opt/seven/mm-interfaceexternal-batch-embossing /home/mmt/deploy/batch_proxy/opt/seven/

echo "Copia Batch_Proxy"
cp /etc/init.d/mm-interfaceexternal-batch-proxy /home/mmt/deploy/batch_proxy/etc/init.d/
cp /etc/seven/mm-interfaceexternal-batch-proxy.config.xml /home/mmt/deploy/batch_proxy/etc/seven/
yes | cp -R /opt/seven/mm-interfaceexternal-batch-proxy /home/mmt/deploy/batch_proxy/opt/seven/

echo "Copia DMS_Services"
cp /etc/seven/DMSServices.config.xml /home/mmt/deploy/dms/etc/seven
cp /opt/wildfly/standalone/deployments/DMS_Services.war /home/mmt/deploy/dms/opt/wildfly/standalone/deployments/

echo "Copia Email"
cp /etc/init.d/mm-interfaceexternal-email /home/mmt/deploy/email/etc/init.d/
cp /etc/seven/mm-interfaceexternal-email.config.xml /home/mmt/deploy/email/etc/seven/
yes | cp -R /opt/seven/mm-interfaceexternal-email /home/mmt/deploy/email/opt/seven/

echo "Copia ISO_Router"
cp /etc/init.d/onipro-mm-mmtisorouter /home/mmt/deploy/iso_router/etc/init.d/
cp /etc/seven/mm-mmtisorouter.config.xml /home/mmt/deploy/iso_router/etc/seven/
yes | cp -R /opt/seven/mm-backgroundservices-policies /home/mmt/deploy/iso_router/opt/seven/

echo "Copia Policies"
cp /etc/init.d/mm-backgroundservices-policies /home/mmt/deploy/policies/etc/init.d/
cp /etc/seven/mm-backgroundservices-policies.config.xml /home/mmt/deploy/policies/etc/seven/
yes | cp -R /opt/seven/mm-backgroundservices-policies /home/mmt/deploy/policies/opt/seven/

echo "Copia SMS"
cp /etc/init.d/mm-interfaceexternal-ws-smsgty /home/mmt/deploy/sms/etc/init.d/
cp /etc/seven/mm-interfaceexternal-ws-smsgty.config.xml /home/mmt/deploy/sms/etc/seven/
yes | cp -R /opt/seven/mm-interfaceexternal-ws-smsgty /home/mmt/deploy/sms/opt/seven/