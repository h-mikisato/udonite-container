FROM node:16-alpine

EXPOSE 8000

ARG USERNAME=udonite
ARG GROUPNAME=udonite
ARG USERID=1000
ARG GROUPID=1000
RUN deluser --remove-home node && \
 addgroup -g ${GROUPID} ${GROUPNAME} && \
 adduser -D -u ${USERID} -G ${GROUPNAME} ${USERNAME} && \
 mkdir /srv/udonite-server && chown ${USERNAME}:${GROUPNAME} /srv/udonite-server && \
 npm install -g npm@"~8.5"
USER $USERNAME:$GROUPNAME

WORKDIR /srv/udonite-server
COPY --chown=${USERNAME}:${GROUPNAME} ./Udonite-Server/package*.json ./

RUN npm install
COPY --chown=${USERNAME}:${GROUPNAME} ./Udonite-Server .
COPY --chown=${USERNAME}:${GROUPNAME} ./default.yaml ./config/

CMD [ "npm", "start" ]
