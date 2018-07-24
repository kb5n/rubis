source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'haml-rails'
gem 'jbuilder', '~> 2.5'
gem 'mechanize'
gem 'pry-rails'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.0'
gem 'refile', require: 'refile/rails', github: 'manfe/refile'
gem 'refile-mini_magick'
gem 'sass-rails', '~> 5.0'
gem 'seed-fu'
gem 'semantic-ui-sass'
gem 'sorcery'
gem 'sqlite3'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'

group :development, :test do
  gem 'brakeman'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'foreman'
  gem 'haml-lint'
  gem 'rails-env-credentials'
  gem 'rspec-rails'
  gem 'rubocop'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'chromedriver-helper'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'rspec_junit_formatter'
  gem 'selenium-webdriver'
end
