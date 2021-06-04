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
echo "Copia Batch_Proxy"
echo "Copia DMS_Services"
echo "Copia Email"
echo "Copia ISO_Router"
echo "Copia Policies"
echo "Copia SMS"