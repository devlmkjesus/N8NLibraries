# Start from the official n8n image
FROM n8nio/n8n:latest

# Switch to root to install extra packages
USER root

# Install docx (and you can add more npm packages here later)
RUN npm install --prefix /usr/local/lib/node_modules docx

# Allow n8n Function nodes to use this external library
ENV NODE_FUNCTION_ALLOW_EXTERNAL=docx

# Switch back to node user for security
USER node

# Start n8n
CMD ["n8n", "start"]
