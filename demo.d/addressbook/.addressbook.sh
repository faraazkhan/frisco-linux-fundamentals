#!/usr/bin/env bash

echo -n "Enter your name: "
read name

echo -n "Enter your address: "
read address

echo -n "Enter your phone number: "
read phone

cat > ${name}_contact.txt <<STOP
    ${name}
    ${address}
    ${phone}
STOP
