FROM n8nio/n8n:latest

USER root

# Installation de Chromium et des dépendances système sur Alpine
RUN apk update && apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont

# On indique à Puppeteer d'utiliser le Chromium d'Alpine
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

USER node
