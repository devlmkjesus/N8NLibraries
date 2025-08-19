# Start from the official n8n image
FROM n8nio/n8n:latest

# Install extra npm libraries (docx, etc.)
USER root
RUN npm install -g npm && \
    npm install docx

# Switch back to the n8n user
USER node
