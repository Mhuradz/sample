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



#Install Nginx, inadd ko nlang den nginx para s client.ovpn
yum -y install nginx php-fpm php-cli
service nginx restart
service php-fpm restart
chkconfig nginx on
chkconfig php-fpm on
service nginx restart
service php-fpm restart

# Server
cd
wget -O /etc/nginx/nginx.conf "https://raw.githubusercontent.com/NikkoRod/sample/master/nginx.conf"
sed -i 's/www-data/nginx/g' /etc/nginx/nginx.conf
mkdir -p /home/vps/public_html
echo "<pre>Modify nyo nlang hehehe ~Nikkorod</pre>" > /home/vps/public_html/index.html
echo "<?php phpinfo(); ?>" > /home/vps/public_html/info.php
rm /etc/nginx/conf.d/*
wget -O /etc/nginx/conf.d/vps.conf "https://raw.githubusercontent.com/NikkoRod/sample/master/vps.conf"
sed -i 's/apache/nginx/g' /etc/php-fpm.d/www.conf
chmod -R +rx /home/vps
service php-fpm restart
service nginx restart
cp client.ovpn /home/vps/public_html/
chown -R nginx:nginx /home/vps/public_html




#ok done kau n bahala s iba


