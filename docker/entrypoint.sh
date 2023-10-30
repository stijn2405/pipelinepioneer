#!/bin/sh

# Leeg de /usr/share/nginx/html directory
rm -rf /usr/share/nginx/html/*

# Voer de Git-kloningsactie uit
git clone https://github.com/stijn2405/pipelinepioneer/website-files.git /usr/share/nginx/html

# Start Nginx
exec "$@"
