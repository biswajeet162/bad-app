# Stage 1: Build the Angular app
FROM node:20-alpine AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the Angular app code to the container
COPY . .

# Build the Angular app
RUN npm run build

# Stage 2: Serve the app with NGINX
FROM nginx:alpine

# Copy the built app from the previous stage to NGINX's HTML directory
COPY --from=build /app/dist/test-app /usr/share/nginx/html

# Expose the port NGINX will run on
EXPOSE 80

# Start NGINX server
CMD ["nginx", "-g", "daemon off;"]
