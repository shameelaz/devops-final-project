# Use the official Node.js 14 image as the base image
FROM node:14

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install dependencies
RUN npm install

# Install vue-cli globally
RUN npm install -g @vue/cli

# Copy the rest of the application code to the working directory
COPY . .

# Expose the port on which the app runs
EXPOSE 8080

# Command to run the app
CMD ["npm", "run", "serve", "--host 0.0.0.0"]
