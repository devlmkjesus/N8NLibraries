FROM n8nio/n8n:latest
USER root
RUN npm install -g docx n8n-nodes-generate-report docxtemplater pizzip
USER node
