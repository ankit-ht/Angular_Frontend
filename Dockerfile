# Use Node.js 10 base image
FROM node:10

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install --legacy-peer-deps

# Copy the rest of the application code
COPY . .

# Expose Angular dev server port
EXPOSE 4200

# Default command: run Angular dev server
CMD ["npm", "start"]
