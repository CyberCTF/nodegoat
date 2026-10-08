# Upstream's Dockerfile (app/Dockerfile) with two changes: the source is copied from app/, and
# the settings of upstream's docker-compose.yml are baked in: MONGODB_URI points at the mongo
# machine, and the command is upstream's compose command (wait for MongoDB, reset the NodeGoat
# data with artifacts/db-reset.js, then start the app).
FROM node:12-alpine
ENV WORKDIR /usr/src/app/
WORKDIR $WORKDIR
COPY app/package*.json $WORKDIR
RUN npm install --production --no-cache

FROM node:12-alpine
ENV USER node
ENV WORKDIR /home/$USER/app
WORKDIR $WORKDIR
COPY --from=0 /usr/src/app/node_modules node_modules
RUN chown $USER:$USER $WORKDIR
COPY --chown=node app/ $WORKDIR
# In production environment uncomment the next line
#RUN chown -R $USER:$USER /home/$USER && chmod -R g-s,o-rx /home/$USER && chmod -R o-wrx $WORKDIR
# Then all further actions including running the containers should be done under non-root user.
USER $USER
EXPOSE 4000
ENV MONGODB_URI=mongodb://mongo:27017/nodegoat
CMD ["sh", "-c", "until nc -z -w 2 mongo 27017 && echo 'mongo is ready for connections' && node artifacts/db-reset.js && npm start; do sleep 2; done"]
