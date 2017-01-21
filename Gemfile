source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.0'

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

# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'jquery-ui-rails'

gem 'stripe'

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
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end

gem 'rails_12factor', group: :production # required for Heroku deployments

ruby "2.3.1" # required for Heroku deployments