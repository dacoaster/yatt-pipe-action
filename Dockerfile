FROM node:16.18-alpine

RUN mkdir /yatt-pipe

COPY package*.json /yatt-pipe/

COPY entrypoint.sh /yatt-pipe/

RUN chmod +x /yatt-pipe/entrypoint.sh

RUN cd /yatt-pipe && npm install

RUN apk add jq

ENTRYPOINT ["/yatt-pipe/entrypoint.sh"]
