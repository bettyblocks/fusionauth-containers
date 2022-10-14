#!/bin/sh

CERT="/etc/ssl/certs/domain-ca-cert.crt"

if [ -f "$CERT" ]; then
    # number of certs in the PEM file
    CERTS=$(grep 'END CERTIFICATE' $CERT| wc -l)

    # For every cert in the PEM file, extract it and import into the JKS keystore
    # awk command: step 1, if line is in the desired cert, print the line
    #              step 2, increment counter when last line of cert is found
    for N in $(seq 0 $(($CERTS - 1))); do
    ALIAS="${CERT%.*}-$N"
    cat $CERT |
        awk "n==$N { print }; /END CERTIFICATE/ { n++ }" |
        /opt/openjdk/bin/keytool -import -cacerts -trustcacerts \
                -alias $ALIAS -storepass changeit -noprompt
    done    
fi

/usr/local/fusionauth/fusionauth-app/apache-tomcat/bin/catalina.sh run