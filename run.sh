#!/bin/sh

CERT="/etc/ssl/certs/domain-ca-cert.crt"

if [ -f "$CERT" ]; then
    /opt/openjdk/bin/keytool -importcert -file $CERT -keystore /tmp/cacerts -storepass changeit  -alias faselfsignedcert -noprompt
fi

/usr/local/fusionauth/fusionauth-app/apache-tomcat/bin/catalina.sh run