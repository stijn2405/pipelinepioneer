# Gebruik de officiële Nginx-image als basisimage
FROM nginx:latest

# Installeer Git om de repo te kunnen clonen
RUN apt-get update && apt-get install -y git

# Kopieer het entrypoint-script naar de container
COPY entrypoint.sh /usr/share/nginx/entrypoint.sh
RUN chmod +x /usr/share/nginx/entrypoint.sh

# Stel het entrypoint-script in als de entrypoint van de container
ENTRYPOINT ["/usr/share/nginx/entrypoint.sh"]

# Zorg ervoor dat Nginx wordt gestart wanneer de container wordt uitgevoerd
CMD ["nginx", "-g", "daemon off;"]
