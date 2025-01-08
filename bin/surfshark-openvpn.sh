#!/bin/bash
set -e
cd ~/openvpn

# Fastest
gpg -d credentials.openvpn.gpg | sudo openvpn --config us-chi.prod.surfshark.comsurfshark_openvpn_udp.ovpn --auth-user-pass /dev/stdin

# India
# gpg -d credentials.openvpn.gpg | sudo openvpn --config in-del.prod.surfshark.comsurfshark_openvpn_udp.ovpn --auth-user-pass /dev/stdin
