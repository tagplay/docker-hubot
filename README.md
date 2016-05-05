# Dockerized Hubot with etcd

[![Docker Repository on Quay.io](https://quay.io/repository/tagplay/hubot/status "Docker Repository on Quay.io")](https://quay.io/repository/tagplay/hubot) [![Gitter](https://badges.gitter.im/Join Chat.svg)](https://gitter.im/Tagplay/docker-hubot?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge)

This is an extendable [Hubot](https://github.com/github/hubot/blob/master/docs/README.md) setup for [Docker](https://www.docker.com/) using [etcd](https://github.com/coreos/etcd) configuration.

It uses etcd for brain data usin [hubot-etcd-brain](https://github.com/chatops/hubot-etcd-brain) so no redis is required.

The default packages installed by default are hubot-etcd-brain, hubot-diagnostics and hubot-scripts. Everything else requires your configuration parameters in etcd. *Config changes need restart of hubot using the `docker restart hubot` command that will write configuration files and install extra packages you define.*


## Settings

### Required Settings

Set up the minimum configuration for Hubot to run.

    etcdctl set /hubot/name mybot
    etcdctl set /hubot/alias Botter
    etcdctl set /hubot/adapter gitter2
    etcdctl set /hubot/packages/hubot-gitter2 "0.1.3"
    etcdctl set /hubot/env/ROOM "acmecorp,acmecorp/uberapp"
    etcdctl set /hubot/env/HUBOT_GITTER2_TOKEN "abc123"
    etcdctl mkdir /hubot/scripts
    etcdctl mkdir /hubot/hubot-scripts

### Extra NPM Packages

    etcdctl set /hubot/packages/hubot-maps "0.0.0"
    etcdctl set /hubot/packages/hubot-google-translate "^0.1.0"
    etcdctl set /hubot/packages/hubot-shipit "^0.1.1"
    etcdctl set /hubot/packages/hubot-pugme "^0.1.0"
    etcdctl set /hubot/packages/hubot-youtube "^0.1.2"
    etcdctl set /hubot/packages/hubot-rules "^0.1.0"
    etcdctl set /hubot/packages/hubot-google-images "^0.1.1"

### Load External Scripts

    etcdctl set /hubot/scripts/hubot-maps true
    etcdctl set /hubot/scripts/hubot-google-translate true
    etcdctl set /hubot/scripts/hubot-shipit true
    etcdctl set /hubot/scripts/hubot-pugme  true
    etcdctl set /hubot/scripts/hubot-youtube true
    etcdctl set /hubot/scripts/hubot-rules  true
    etcdctl set /hubot/scripts/hubot-google-images true

### Load Scripts from hubot-scripts

Note: You are responsible yourself for adding required npm packages into `/hubot/packages/*`

    etcdctl set /hubot/hubot-scripts/achievement_unlocked.coffee true
    etcdctl set /hubot/hubot-scripts/github-credentials.coffee true

### Set Environment Variables

    etcdctl set /hubot/env/TEST_ENV "Hello World"
    etcdctl set /hubot/env/GITHUB_API_TOKEN "abcdefg"

### Add additional scripts path to hubot startup (--require parameter)

Note: You will want to share this path on the container startup 
   
    etcdctl set /hubot/requires /hubot/packages
   
## Starting Hubot

The bot uses etcd for both configuration and brain data.

    docker run -d --name hubot --port <HOST_PORT>:8080\
      --env "HUBOT_ETCD_HOST=<ETCD_IP>" --env "HUBOT_ETCD_PORT=4001" \
      quay.io/tagplay/hubot:latest
