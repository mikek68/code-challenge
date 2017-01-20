source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.0'

# Use sqlite3 as the database for Active Record
# gem 'sqlite3'

gem 'pg'

# Use Devise for Authorization
gem 'devise'
gem 'devise-encryptable'
gem 'devise-token_authenticatable'

# Use Active Admin
gem 'activeadmin', github: 'gregbell/active_admin'

gem 'simple_form'
gem 'slim-rails'
gem 'active_model_serializers'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
# gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
# gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
# gem 'spring',        group: :development

group :assets do
  # Use SCSS for stylesheets
  gem 'sass-rails', '~> 4.0.3'

  # Use CoffeeScript for .js.coffee assets and views
  gem 'coffee-rails'
end

group :development do
  gem 'better_errors' # fancy error pages
  gem 'binding_of_caller' # required some better_erorrs features
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  gem 'spring'
end

group :development, :test do
  gem 'letter_opener'
  gem 'rspec-rails'
end

group :test do
  gem 'factory_girl_rails'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]

gem 'rails_12factor', group: :production

ruby "2.3.1"