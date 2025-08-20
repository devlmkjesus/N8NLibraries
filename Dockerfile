FROM n8nio/n8n:latest
USER root
WORKDIR /data
RUN npm install https://github.com/devlmkjesus/N8NLibraries.git#main
USER node
