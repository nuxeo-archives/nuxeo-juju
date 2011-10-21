#!/bin/sh

juju bootstrap
sleep 120
juju status

juju deploy --repository=charms local:haproxy
juju deploy --repository=charms local:nuxeo

juju add-relation haproxy:reverseproxy nuxeo:website

juju expose haproxy
