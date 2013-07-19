source 'https://rubygems.org'
ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.0.rc1'

group :test, :development do
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'localtunnel'
  gem "sqlite3", :platform => [:ruby, :mswin, :mingw]
  gem "rspec-rails"
  gem "capybara"
  gem "rake"
  gem "travis-lint"
  gem 'cane_extensions', github: 'everydayhero/cane_extensions'
  gem 'database_cleaner'

  gem 'simplecov', :require => false

  if RUBY_VERSION >= '1.9'
    gem 'coveralls', :require => false
  end
end

group :production do
  gem 'pg'
  gem 'thin'
end

gem 'omniauth-facebook'

gem 'newrelic_rpm'

gem 'activesupport'

gem 'twitter-bootstrap-rails'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0.rc1'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.0.1'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

# Use debugger
# gem 'debugger', group: [:development, :test]
