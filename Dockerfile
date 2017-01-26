FROM mhart/alpine-node:6.9.4

#WORKDIR /src
#ADD . .

RUN adduser -s /bin/false -D app

# If native dependencies needed
# RUN apk add --no-cache make gcc g++ python

ENV HOME=/home/app

COPY package.json npm-shrinkwrap.json $HOME/src/
RUN chown -R app:app $HOME/*

USER app
WORKDIR $HOME/src
# If you need npm, don't use a base tag
RUN npm install

COPY ./index.js ./index.html $HOME/src/

EXPOSE 3000
CMD ["node", "/home/app/src/index.js"]
