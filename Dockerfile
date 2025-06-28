# Stage 1: Build Angular app
FROM node:10 as build

WORKDIR /app

# Install dependencies
COPY package.json package-lock.json ./
RUN npm install

# Copy source files
COPY . .

# Build the Angular app
RUN npm run build --prod

EXPOSE 4200

CMD [ "npm", "start" ]



