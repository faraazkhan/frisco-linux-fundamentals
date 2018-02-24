#!/usr/bin/env bash

openssl req -newkey rsa:2048 -nodes -keyout friscomasjid.key -out friscomasjid.csr -config .openssl.cnf
