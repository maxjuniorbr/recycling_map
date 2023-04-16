# Gems para o funcionamento do Rails
source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", "~> 7.0.4", ">= 7.0.4.3"
gem "sprockets-rails"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "jbuilder"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false

# Gems para desenvolvimento
group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end
gem "web-console"

# Gems para testes
group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end

# Gems para o front-end
gem 'jquery-rails'
gem 'sassc-rails'

# Outras gems
gem 'rubocop'
gem 'htmlbeautifier'