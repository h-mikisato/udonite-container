FROM node:16-alpine

EXPOSE 8000

WORKDIR /srv/udonite
COPY ./build.sh .

COPY ./Udonite/package*.json ./
RUN npm install

COPY ./Udonite .
COPY ./config.yaml ./src/assets

CMD [ "./build.sh" ]
