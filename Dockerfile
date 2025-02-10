# Stage 1: Build the application
FROM node:16.17.0-alpine as builder

# Set the working directory
WORKDIR /app

# Copy dependency files
COPY ./package.json .
COPY ./yarn.lock .

# Install dependencies
RUN yarn install

# Copy the application source code
COPY . .

# Accept the TMDB API key as a build argument and set it as an environment variable
ARG TMDB_V3_API_KEY
ENV VITE_APP_TMDB_V3_API_KEY=${TMDB_V3_API_KEY}
ENV VITE_APP_API_ENDPOINT_URL="https://api.themoviedb.org/3"

# Build the application
RUN yarn build

# Stage 2: Minimal node server to serve the app (no Nginx)
FROM node:16.17.0-alpine

# Set working directory in the final container
WORKDIR /usr/src/app

# Copy the built app from the builder stage
COPY --from=builder /app/dist .

# Install a minimal HTTP server to serve static files
RUN npm install -g serve

# Expose port 3000
EXPOSE 3000

# Serve the app using a simple HTTP server
CMD ["serve", "-s", ".", "-l", "3000"]

