FROM ghcr.io/openclaw/openclaw:latest

USER root
RUN apt update && \
    apt install -y sudo golang-go libnspr4 libnss3 libatk1.0-0 libatk-bridge2.0-0 libdbus-1-3 libcups2 libxkbcommon0 libatspi2.0-0 libxcomposite1 libxdamage1 libxfixes3 libxrandr2 libgbm1 libasound2 chromium  build-essential curl file git procps ca-certificates && \
    mkdir -p /home/linuxbrew/.linuxbrew && \
    chown -R node:node /home/linuxbrew
ENV PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH


USER node
RUN NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" && \
    node /app/node_modules/playwright-core/cli.js install chromium
