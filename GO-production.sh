#!/bin/sh

#
# ./GO myserver.com toto@myserver.com
#

server=$1
email=$2

/bin/rm -fr output
/bin/rm -fr live

./node_modules/.bin/letsencrypt certonly \
  --agree-tos --email $email \
  --standalone \
  --rsa-key-size 2048 \
  --domains $server \
  --cert-path $server-cert.pem \
  --fullchain-path $server-fullchain.pem \
  --chain-path $server-chain.pem \
  --server https://acme-v01.api.letsencrypt.org/directory \
  --config-dir $PWD/output/etc

cp output/etc/live/$server/privkey.pem $server-privkey.pem

/bin/rm -fr output
/bin/rm -fr live
mkdir live
mv $server-privkey.pem live/$server-server.key
mv $server-cert.pem live/$server-server.crt
mv $server-chain.pem live/$server-ca.crt

/bin/rm -f *.pem

echo ""
echo "SAGE2 certificates in 'live' folder"
echo ""

# for testing:
#     https://acme-staging.api.letsencrypt.org/directory
# for production:
#     https://acme-v01.api.letsencrypt.org/directory
# personal server (docker)
#  --server http://localhost:4000/directory

