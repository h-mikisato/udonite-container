FROM node:16-alpine

WORKDIR /srv/udonite-server
COPY ./Udonite-Server/package*.json ./

RUN npm install
COPY ./Udonite-Server .
COPY ./default.yaml ./config/

EXPOSE 8000
CMD [ "npm", "start" ]
