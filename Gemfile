source 'https://rubygems.org'
ruby '2.0.0'
#ruby '1.9.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0.rc1'

group :test, :development do
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'localtunnel'
  gem 'sqlite3', :platform => [:ruby, :mswin, :mingw]
  gem 'rspec-rails'
  gem 'capybara'
  gem 'rake'
  gem 'travis-lint'
  gem 'cane_extensions', github: 'everydayhero/cane_extensions'
  gem 'database_cleaner'
  gem 'dotenv-rails'

  gem 'simplecov', :require => false

  if RUBY_VERSION >= '1.9'
    gem 'coveralls', :require => false
  end
end

group :development do
  gem 'thor'
  gem 'rack-mini-profiler'
end

group :production do
  gem 'pg'
  gem 'thin'
end

gem 'omniauth-facebook'

gem 'newrelic_rpm'

gem 'activesupport'

gem 'twitter-bootstrap-rails'

gem 'sass-rails', '~> 4.0.0.rc1'

gem 'uglifier', '>= 1.3.0'

gem 'coffee-rails', '~> 4.0.0'

gem 'jquery-rails'

gem 'turbolinks'

gem 'jbuilder', '~> 1.0.1'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end
