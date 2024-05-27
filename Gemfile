# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

gem 'aws-sdk-secretsmanager'
gem 'bcrypt'
gem 'bootsnap', require: false
gem 'config'
gem 'dry-validation'
gem 'interactor'
gem 'jbuilder'
gem 'jsbundling-rails'
gem 'jwt'
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.1.3', '>= 7.1.3.2'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[windows jruby]

group :development, :test do
  gem 'brakeman'
  gem 'bullet'
  gem 'debug', platforms: %i[mri windows]
  gem 'rspec-rails', '~> 6.1.0'
  gem 'rubocop', '~> 1.63'
end

group :test do
  gem 'simplecov'
end

group :development do
  gem 'web-console'
end
