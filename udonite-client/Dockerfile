FROM node:16-alpine

WORKDIR /srv/udonite
COPY ./build.sh .

COPY ./Udonite/package*.json ./
RUN npm install

COPY ./Udonite .
COPY ./config.yaml ./src/assets

EXPOSE 8000
CMD [ "./build.sh" ]
