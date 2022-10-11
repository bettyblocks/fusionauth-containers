#!/bin/sh

CERT="/etc/ssl/certs/domain-ca-cert.crt"

if [ -f "$CERT" ]; then
    /opt/openjdk/bin/keytool -importcert -file $CERT -keystore $JAVA_HOME/lib/security/cacerts -alias faselfsignedcert -noprompt
fi

/usr/local/fusionauth/fusionauth-app/apache-tomcat/bin/catalina.sh run