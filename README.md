# Dockerized Hubot with ETCD [![Docker Repository on Quay.io](https://quay.io/repository/tagplay/hubot/status "Docker Repository on Quay.io")](https://quay.io/repository/tagplay/hubot)


## Basic Settings

  etcdctl set /hubot/name mybot
  etcdctl set /hubot/alias Botter

  etcdctl set /hubot/adapter gitter
  etcdctl set /hubot/packages/hubot-gitter "0.0.3"
  etcdctl set /hubot/env/ROOM "acmecorp,acmecorp/uberapp"
  etcdctl set /hubot/env/TOKEN "abc123"

## Extra NPM Packages

  etcdctl set /hubot/packages/hubot-maps "0.0.0"
  etcdctl set /hubot/packages/hubot-google-translate "^0.1.0"
  etcdctl set /hubot/packages/hubot-shipit "^0.1.1"
  etcdctl set /hubot/packages/hubot-pugme "^0.1.0"
  etcdctl set /hubot/packages/hubot-youtube "^0.1.2"
  etcdctl set /hubot/packages/hubot-rules "^0.1.0"
  etcdctl set /hubot/packages/hubot-google-images "^0.1.1"

## Load External Scripts

  etcdctl set /hubot/scripts/hubot-maps true
  etcdctl set /hubot/scripts/hubot-google-translate true
  etcdctl set /hubot/scripts/hubot-shipit true
  etcdctl set /hubot/scripts/hubot-pugme  true
  etcdctl set /hubot/scripts/hubot-youtube true
  etcdctl set /hubot/scripts/hubot-rules  true
  etcdctl set /hubot/scripts/hubot-google-images true

## Set Environment Variables

  etcdctl set /hubot/env/TEST_ENV "Hello World"
  etcdctl set /hubot/env/GITHUB_API_TOKEN "abcdefg"


## Starting

  docker run --name hubot --link redis:redis quay.io/tagplay/hubot
