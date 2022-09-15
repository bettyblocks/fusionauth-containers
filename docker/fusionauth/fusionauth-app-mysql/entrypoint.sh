#!/bin/sh

$CERT = "/etc/ssl/certs/domain-ca-cert.crt"

if [ -f "$CERT" ]; then
    /opt/openjdk/bin/keytool -importcert -file $CERT -keystore fusionauth/java/current/lib/security/cacerts -storepass changeit  -alias faselfsignedcert
fi

# Hand off to the CMD
exec "$@"