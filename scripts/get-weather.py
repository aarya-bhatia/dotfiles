#!/usr/bin/env python3

import os
import requests

filepath = os.path.join(os.path.expanduser("~"), "/tmp/locations")

default_locations = ["ord", "sfo", "lax", "del"]
locations = []

if not os.path.exists(filepath):
    print(f"Creating file {filepath} with default locations...")
    with open(filepath, 'w') as file:
        for location in default_locations:
            file.write(f"{location}\n")

    locations = default_locations
else:
    with open(filepath, 'r') as file:
        lines = file.readlines()
        locations = [line.strip('\n') for line in lines]


for i, location in enumerate( locations ):
    print(f"{i+1}. {location.upper()}")
print(f"{len(locations)+1}. Custom")

choice = int(input(f"Choose an option [1-{len(locations) + 1}]: "))

url = ""

if choice < 0:
    print("Invalid option")
    exit(1)

if choice < len(locations):
    url = f"https://wttr.in/{locations[choice]}?Q&m&1"
    # choice = input("Make default location?")
else:
    new_location = str(input("Enter new location:"))
    new_location = '+'.join(new_location.strip().lower().split())
    url = f"https://wttr.in/{new_location}?Q&m&1"

    choice = input("Save location [y/n]?")[0]
    if choice == 'y' or choice == 'Y':
        with open(filepath, 'a') as file:
            file.write(f'{new_location}\n')
            print(f'Updated file {filepath}')


response = requests.get(url)
print(response.text)
