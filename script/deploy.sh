#!/bin/bash
if [ "$1" == "production" ]; then
  git push heroku master && heroku run rake db:migrate --app gethopscotch && heroku restart --app gethopscotch
else
  git push staging master && heroku run rake db:migrate --app kits-staging && heroku restart --app kits-staging
fi

