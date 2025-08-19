# Start from the official n8n image
FROM n8nio/n8n:latest

# Switch to root user
USER root

# Install docx inside the global node_modules directory
RUN npm install --prefix /usr/local/lib/node_modules docx

# Allow n8n Function nodes to use external packages
ENV NODE_FUNCTION_ALLOW_EXTERNAL=*

# Switch back to node user
USER node
