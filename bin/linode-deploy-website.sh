#!/bin/sh
HOST=linode
for site in $(echo www.aaryab.in www.ananyaatanwar.xyz); do 
  echo "Pulling latest changes for $site..."
  ssh $HOST "cd $site && git pull"
done
