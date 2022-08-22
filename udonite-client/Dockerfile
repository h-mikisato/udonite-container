FROM node:16-alpine

ARG USERNAME=udonite
ARG GROUPNAME=udonite
ARG USERID=1000
ARG GROUPID=1000
RUN deluser --remove-home node && \
 addgroup -g ${GROUPID} ${GROUPNAME} && \
 adduser -D -u ${USERID} -G ${GROUPNAME} ${USERNAME} && \
 mkdir /srv/udonite && chown ${USERNAME}:${GROUPNAME} /srv/udonite && \
 npm install -g npm@"~8.15"
USER $USERNAME:$GROUPNAME

WORKDIR /srv/udonite
COPY --chown=${USERNAME}:${GROUPNAME} ./build.sh .

COPY --chown=${USERNAME}:${GROUPNAME} ./Udonite/package*.json ./
RUN npm install

COPY --chown=${USERNAME}:${GROUPNAME} ./Udonite .
COPY --chown=${USERNAME}:${GROUPNAME} ./config.yaml ./src/assets

CMD [ "./build.sh" ]
