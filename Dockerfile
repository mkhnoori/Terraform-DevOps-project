# Stage 1: Build the application using Node.js
FROM node:16-alpine AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy dependency files
COPY package.json package-lock.json ./

# Install dependencies using npm
RUN npm install

# Copy the application code
COPY . .

# Build the application (if needed, like React or Vite apps)
RUN npm run build

# Stage 2: Production image using lightweight Nginx
FROM nginx:stable-alpine

# Remove default Nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy built application from the builder stage
COPY --from=builder /app/dist /usr/share/nginx/html

# Copy custom Nginx configuration (if needed)
# COPY nginx.conf /etc/nginx/nginx.conf

# Expose the application port
EXPOSE 80

# Start Nginx in foreground
CMD ["nginx", "-g", "daemon off;"]


