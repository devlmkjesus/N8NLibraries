FROM n8nio/n8n:latest
USER root
RUN npm install -g docx
RUN npm install -g docxtemplater
RUN npm install -g pizzip
USER node
CMD ["n8n"]
