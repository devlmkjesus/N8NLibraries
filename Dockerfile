# Start from the official n8n image
FROM n8nio/n8n:latest
RUN npm n8n-nodes-generate-report
