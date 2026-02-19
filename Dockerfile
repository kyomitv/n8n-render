FROM node:18-slim

# Installer Chromium et dépendances
RUN apt-get update && apt-get install -y \
  chromium \
  ca-certificates \
  fonts-liberation \
  libnss3 \
  libatk-bridge2.0-0 \
  libx11-xcb1 \
  libxcomposite1 \
  libxdamage1 \
  libxrandr2 \
  libgbm1 \
  libasound2 \
  xdg-utils \
  && rm -rf /var/lib/apt/lists/*

# Installer n8n globalement
RUN npm install -g n8n

ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium
ENV NODE_ENV=production

EXPOSE 5678

CMD ["n8n"]
