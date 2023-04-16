# Gems para o funcionamento do Rails
source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

gem "rails", "~> 7.0.4", ">= 7.0.4.3" # framework Rails
gem "sprockets-rails" # pipeline de assets do Rails
gem "pg", "~> 1.1" # adaptador para PostgreSQL
gem "puma", "~> 5.0" # servidor web
gem "importmap-rails" # carregamento de módulos JS
gem "turbo-rails" # biblioteca de JavaScript
gem "stimulus-rails" # framework de JavaScript
gem "jbuilder" # renderização JSON
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ] # informações de fuso horário
gem "bootsnap", require: false # cache de carregamento de código

# Gems para desenvolvimento
group :development, :test do
  gem "debug", platforms: %i[ mri mingw x64_mingw ] # depuração
end
gem "web-console" # console do Rails no navegador
gem 'erb-formatter' # formatador de saída para testes

# Gems para testes
group :test do
  gem "capybara" # testes de aceitação
  gem "selenium-webdriver" # driver para testes com navegador
  gem "webdrivers" # gerenciador de drivers para testes com navegador
end

# Gems para o front-end
gem 'jquery-rails' # biblioteca JavaScript
gem 'sassc-rails' # pré-processador Sass

# Outras gems
gem 'rubocop' # linter para verificação do código-fonte