#!/bin/bash

case $1 in
  setup_concourse)
    ./keys/generate
    if which fly > /dev/null ; then
      brew cask install fly
    fi
  ;;

  # Concourse locally
  docker_run_concourse)
    docker-compose -f docker-compose.yml up -d
  ;;

  docker_stop_concourse)
    docker-compose -f docker-compose.yml stop
  ;;

  # Concourse commands
  concourse_login)
  if [[ $2 ]]; then
    fly --target $2 login --team-name main --concourse-url http://localhost:8080
  else
    echo 'missing target'
  fi
  ;;

  *)
    echo -n "unknown cmd :("
  ;;
esac
