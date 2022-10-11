#!/bin/sh

CERT="/etc/ssl/certs/domain-ca-cert.crt"

if [ -f "$CERT" ]; then
    /opt/openjdk/bin/keytool -importcert -file $CERT -cacerts -storepass changeit -alias faselfsignedcert -noprompt -trustcacerts
fi

/usr/local/fusionauth/fusionauth-app/apache-tomcat/bin/catalina.sh run