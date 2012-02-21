source 'http://rubygems.org'

gem 'cancan'
gem 'rails', '3.1.1.rc1'
gem 'simple_form'
gem 'slim-rails'
gem 'will_paginate'
gem 'underscore-rails'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier', '>= 1.0.3'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'lorem_athlete'
  gem 'auto_tagger'
  gem 'foreman'
  gem "rspec-rails"
  gem 'sqlite3'
  gem 'mongrel', '1.2.0.pre2'
  gem "taps"
  gem "yaml_db"
end

group :development do
  gem 'rmagick'
  gem 'sprite'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test do
  gem 'database_cleaner'
  gem 'capybara'
  gem 'ruby-debug19'
  gem "shoulda-matchers"
  gem 'simplecov'
end
