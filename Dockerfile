# Base image
FROM node:14

# Create application directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose port (assuming the app runs on 3000)
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
