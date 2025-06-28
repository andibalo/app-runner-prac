FROM node:slim

WORKDIR /app

COPY package.json package-lock.json ./

RUN npm install

# If no changes to package.json then copy . . will not overwrite it
COPY . .

EXPOSE 3000

ENTRYPOINT [ "node" , "./bin/www"]
