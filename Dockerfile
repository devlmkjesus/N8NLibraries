FROM n8nio/n8n:latest
USER root
RUN npm install -g docx pizzip docxtemplater
RUN apt-get update && \
    apt-get install -y libreoffice && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
USER node
