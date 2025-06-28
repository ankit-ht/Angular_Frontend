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

# Stage 2: Serve app using NGINX
FROM nginx:1.17-alpine

# Remove default nginx config
RUN rm /etc/nginx/conf.d/default.conf

# Add custom nginx config
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Copy Angular build output
COPY --from=build /app/dist/shopping-app /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

