FROM node:0.10-slim

ADD https://github.com/kelseyhightower/confd/releases/download/v0.11.0/confd-0.11.0-linux-amd64 /usr/bin/confd
COPY confd /etc/confd

COPY package.json /app/package.json
COPY bin/start /app/bin/start
RUN chmod a+x /usr/bin/confd && cd /app && npm install --production && npm cache clean

EXPOSE  8080
CMD ["/app/bin/start"]
