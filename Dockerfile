FROM n8nio/n8n:latest

USER root

# Installation des dépendances pour Chrome / Puppeteer
RUN apt-get update && apt-get install -y \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Indiquer à Puppeteer d'utiliser le Chrome installé au lieu d'essayer d'en télécharger un
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

USER node
