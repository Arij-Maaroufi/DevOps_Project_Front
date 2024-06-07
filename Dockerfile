# Stage 1: Build the Angular application
FROM node:16 AS build

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install Angular CLI
RUN npm install -g @angular/cli@16.1.2

# Install app dependencies
RUN npm install

# Copy the Angular project files to the working directory
COPY . .

# Build the Angular app for production
RUN ng build 

# Stage 2: Serve the Angular application with Nginx
FROM nginx:alpine

# Copy the built Angular app from the build stage to the Nginx HTML directory
COPY --from=build /app/dist/summer-workshop-angular /usr/share/nginx/html

COPY ./nginx.conf /etc/nginx/conf.d/default.conf
