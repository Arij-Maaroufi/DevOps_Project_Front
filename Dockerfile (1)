FROM node:12 AS build
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install -f

# Copy the rest of the app source code
COPY . .

# Build the Angular app
RUN npm run build


# Stage 2: Runtime
FROM nginx:1.21.1
COPY --from=build /app/dist/summer-workshop-angular /usr/share/nginx/html

# Copy the custom nginx configuration (optional)
# COPY ./nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 4200
CMD ["nginx", "-g", "daemon off;"]
