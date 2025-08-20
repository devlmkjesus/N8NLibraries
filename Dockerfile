FROM n8nio/n8n:latest
USER root
WORKDIR /data
RUN npm install docxtemplater pizzip
USER node
