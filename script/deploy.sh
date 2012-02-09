#!/bin/bash
if [ "$1" == "production" ]; then
  git push heroku master && heroku run rake db:migrate --app hopscotchkits && heroku restart --app hopscotchkits && autotag create 'production'
else
  git push staging master && heroku run rake db:migrate --app kits-staging && heroku restart --app kits-staging && autotag create 'staging'
fi

