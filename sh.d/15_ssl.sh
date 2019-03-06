#!/bin/bash
function sslcheckcerts {
	if [[ $1 == '' ]] || [[ $1 == '' ]] || [[ $1 == '' ]]; then
	    echo " sslcheckcerts [privatekey] [publickey] [chain] : checks"
	else
		openssl x509 -noout -modulus -in $2 | openssl md5
		openssl rsa -noout -modulus -in $1 | openssl md5
		openssl verify -verbose -purpose sslserver -CAfile $3 $2 
	fi
}

alias sslgetcn='openssl x509 -noout -subject -in '
