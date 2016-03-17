#letsage2
  scripts to provide SSL certificates for SAGE2 using letsencrypt

Based on:
 - https://github.com/Daplie/node-letsencrypt
 - npm install letsencrypt letsencrypt-cli

## Requirements
  - Scripts need administrator rights to acces priviledge ports (*Administrator or sudo access*).
  - your need the FQDN of your server (i.e. myserver.unit.domain.com)
  - scripts need to be run on the SAGE2 host, with SAGE2 NOT running
  - **Only a few certifcates can be generated at this point per week per domain, go easy (use test scripts)**

## To test on Windows
  - GO.bat myserver.example.com myemail@example.com
  - invalid certificates, but test the process

## Generate valid cert on Windows
  - GO-production.bat myserver.example.com myemail@example.com
  - certificates for SAGE2 in the folder called 'live', to be copied into SAGE2/keys folder

## To test on Unix system
  - requires a compiler and developmentn environment with SSL libraries
  - GO.sh myserver.example.com myemail@example.com

## Generate valid cert on Unix system
  - GO-production.sh myserver.example.com myemail@example.com
  - certificates for SAGE2 in the folder called 'live', to be copied into SAGE2/keys folder

