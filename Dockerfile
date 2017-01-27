FROM mhart/alpine-node:6.9.4

#WORKDIR /src
#ADD . .

RUN adduser -s /bin/false -D app

# If native dependencies needed
# RUN apk add --no-cache make gcc g++ python

ENV HOME=/home/app

COPY package.json npm-shrinkwrap.json $HOME/
RUN chown -R app:app $HOME/*

USER app
WORKDIR $HOME
# If you need npm, don't use a base tag
RUN npm install

COPY ./src $HOME/src
COPY ./test $HOME/test

EXPOSE 3000
#CMD ["node", "/home/app/src/index.js"]
