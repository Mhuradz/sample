# Team Epiphany
# Nikkorod
# Squid 3.1 + Openvpn + Webmin auto installer
# credits to Nyr for ovpn
# fresh rebuild muna o create new centos drop para safe hehe
# Tested on centos 6.9 x64

#UPDATE & UPGRADE 
yum update && yum upgrade
#SQUID 
yum install squid
# Download my squid.conf  (gawa nlang kau ng s inyo kung di nyo po e2 gusto hehe) NOTE : public ito
wget -O /etc/squid/squid.conf https://raw.githubusercontent.com/NikkoRod/sample/master/squid.conf

# Install Webmin (ngka prob aq kgabi s netssl kaya sali ko nlang e2)
yum -y install perl perl-Net-SSLeay openssl perl-IO-Tty perl-Encode-Detect
wget https://download.webmin.com/download/yum/webmin-1.801-1.noarch.rpm
rpm -i webmin-1.801-1.noarch.rpm
sed -i 's/ssl=1/ssl=0/g' /etc/webmin/miniserv.conf
service webmin restart


#Install OpenVPN follow nyo nlang instructions No password e2
wget https://git.io/vpn -O openvpn-install.sh && bash openvpn-install.sh


#ok done kau n bahala s iba


