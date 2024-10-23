#!/bin/bash
gpg -d ~/credentials.openvpn.gpg | sudo openvpn --config ~/Downloads/us-chi.prod.surfshark.comsurfshark_openvpn_udp.ovpn --auth-user-pass /dev/stdin
