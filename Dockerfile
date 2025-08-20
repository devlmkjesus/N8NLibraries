FROM n8nio/n8n:latest

USER root
RUN npm install -g docxtemplater pizzip
USER node
EXPOSE 5678
