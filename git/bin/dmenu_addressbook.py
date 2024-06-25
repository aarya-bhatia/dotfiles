#!/usr/bin/env python3

import re
import subprocess

ADDRESS_BOOK = "/home/aarya/.abook/addressbook"

with open(ADDRESS_BOOK, "r") as file:
    contacts = []
    cur = None
    for line in file:
        line = line.strip()

        if not line or re.match(r'^\[.*\]$', line):
            if cur and 'name' in cur:
                contacts.append(cur)

            cur = {}

        if re.match(r'^[a-z]+=.*$', line):
            tok = line.split('=')
            key = tok[0]
            val = tok[1]

            cur[key] = val

    names = []
    for contact in contacts:
        names.append(contact["name"])

    print(contacts)

    sel = subprocess.run(["dmenu", "-i"], input="\n".join(names), capture_output=True, text=True).stdout.strip()
    if not sel:
        exit(0)

    options = []
    values = []
    for contact in contacts:
        if contact["name"] == sel:
            for option in ["name", "email", "phone"]:
                if option in contact:
                    options.append(option)
                    values.append(contact[option])

            # for key, val in contact.items():
            #     if key and val:
            #         options.append(key)
            #         values.append(val)

    sel = subprocess.run(["dmenu", "-i"], input="\n".join(options), capture_output=True, text=True).stdout.strip()
    if not sel:
        exit(0)

    for i in range(len(options)):
        if options[i] == sel:
            val_options = values[i].split(",")
            if len(val_options) == 1:
                subprocess.run(["xdotool", "type", val_options[0]])
                exit(0)

            sel = subprocess.run(["dmenu", "-i"], input="\n".join(val_options), capture_output=True, text=True).stdout.strip()

            subprocess.run(["xdotool", "type", sel])


