FROM node:0.10-slim

COPY bin/confd /usr/bin/confd
COPY confd /etc/confd

COPY package.json /app/package.json
COPY bin/start /app/bin/start
RUN cd /app; npm install --production; npm cache clean

EXPOSE  8080
CMD ["node", "/app/init.js"]
