# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.0'

gem 'bootsnap', require: false
gem 'gds-api-adapters', '~> 85'
# gem 'gds-sso' Not needed at the moment
gem 'govuk_app_config', '~> 5.0'
gem 'govuk_publishing_components', '~> 34'
gem 'pg', '~> 1.4'
gem 'plek', '~> 5.0'
gem 'rails', '~> 7.0'

group :development, :test do
  gem 'byebug', '~> 11'
  gem "debug", '~> 1.7'
  gem 'dotenv-rails', '~> 2.8'
  gem 'govuk_test', '~> 3.0'
  gem 'rspec-rails', '~> 6.0.0'
  gem 'rubocop-govuk', '~> 4.9'
end

group :development do
  gem 'web-console', '~> 4.2'
  gem 'listen', '~> 3.8'
end

group :test do
  gem 'simplecov', '~> 0.22'
end
