FROM n8nio/n8n:latest
USER root
WORKDIR /data
RUN npm install docx
USER node
