========================stage1============================

# Build Stage
FROM node:23-slim as build

# set working directory
WORKDIR /app

# copy package files
COPY package*.json ./

# install dependencies
RUN npm ci

# copy project files
COPY . .

# build the app
RUN npm run build

=======================stage2===============================

# production stage
FROM node:23-slim

# set working directory
WORKDIR /app

# install serve package globally
RUN npm install -g serve

# copy build file from build stage
COPY --from=build /app/dist ./dist

# expose port 3000
EXPOSE 3000

# start the application
CMD ["serve", "-s", "dist", "-l", "3000"]

 
