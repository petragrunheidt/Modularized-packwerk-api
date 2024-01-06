source 'https://rubygems.org'

ruby '3.2.2'

gem 'bootsnap', require: false
gem 'devise_token_auth'
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.0.4', '>= 7.0.4.3'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'brakeman'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end

group :development do
  gem 'rubocop-rails', require: false
  gem 'simplecov', require: false
end
