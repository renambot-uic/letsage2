@echo off

REM Must be run as administrator
pushd %~dp0

set SERVER=%1
set EMAIL=%2

rmdir /Q /S output
rmdir /Q /S live

\node_modules\.bin\letsencrypt certonly --agree-tos --email %EMAIL% --standalone --rsa-key-size 2048 --domains %SERVER% --cert-path %SERVER%-cert.pem --fullchain-path %SERVER%-fullchain.pem --chain-path %SERVER%-chain.pem --server https://acme-staging.api.letsencrypt.org/directory --config-dir %CD%\output\etc

copy output\etc\live\%SERVER%\privkey.pem %SERVER%-privkey.pem

rmdir /Q /S output
rmdir /Q /S live
mkdir live
move %SERVER%-privkey.pem live\%SERVER%-server.key
move %SERVER%-cert.pem live\%SERVER%-server.crt
move %SERVER%-chain.pem live\%SERVER%-ca.crt

del /Q *.pem

echo:
echo SAGE2 certificates in 'live' folder
echo:

