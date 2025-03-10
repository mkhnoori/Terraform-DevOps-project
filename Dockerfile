# Use Node.js Alpine base image
FROM node:alpine

# Create and set the working directory inside the container
WORKDIR /app

# Pass the API key as a build argument
ARG TMDB_V3_API_KEY
ENV VITE_APP_TMDB_V3_API_KEY=a806b329b0aabede475d9fe0c40410e9
ENV VITE_APP_API_ENDPOINT_URL="https://api.themoviedb.org/3"
# Copy package.json and package-lock.json to the working directory
COPY package.json package-lock.json /app/

# Install dependencies
RUN npm install

# Copy the entire codebase to the working directory
COPY . /app/

# Expose the port your container app
EXPOSE 3000    

# Define the command to start your application (replace "start" with the actual command to start your app)
CMD ["npm", "start"]


