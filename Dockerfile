FROM node:16.18-alpine

RUN mkdir /yatt-pipe
WORKDIR /yatt-pipe

COPY package*.json /yatt-pipe/

RUN npm install

ENTRYPOINT ["sh", "-c", "node node_modules/yatt-pipe/index.js"]
