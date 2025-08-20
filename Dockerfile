FROM n8nio/n8n:latest
USER root
RUN npm install --prefix /usr/local/lib/node_modules docx
ENV NODE_FUNCTION_ALLOW_EXTERNAL=*
USER node
