if grep -q "autoindex off" /etc/nginx/sites-available/nginx-host-conf
	then
		sed -i -e 's/autoindex off/autoindex on/g' /etc/nginx/sites-available/nginx-host-conf
else
	sed -i -e 's/autoindex on/autoindex off/g' /etc/nginx/sites-available/nginx-host-conf
fi
rm -f nginx-host-conf-e
service nginx restart
