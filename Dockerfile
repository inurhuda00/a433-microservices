
FROM node:18-alpine as base

# Set the working directory in the container
WORKDIR /app
# Copy package.json and package-lock.json to the container
COPY package*.json ./

FROM base as dev
# Install dependencies
RUN npm install
# Copy the rest of the application code
COPY . .

# Wait on the availability of a TCP host and port
RUN apk add --no-cache bash
RUN wget -O /bin/wait-for-it.sh https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh
RUN chmod +x /bin/wait-for-it.sh

# Command to run the application
CMD ["node", "index.js"]
