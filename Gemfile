source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Debugger
  gem 'pry', '~> 0.13.1'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.1', '>= 2.1.1'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Intellisense & much more
  gem 'solargraph', '~> 0.39.17'
  # Better errors replace standard Rails error page
  gem 'better_errors', '~> 2.9', '>= 2.9.1'
  gem 'binding_of_caller', '~> 0.8.0'
  # Ruby static analyzer and code formatter
  gem "rubocop", require: false
  # Preview email in browser
  gem 'letter_opener', '~> 1.7'
  # Generate Diagram
  gem 'rails-erd', '~> 1.6'
  
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver', '~> 3.142', '>= 3.142.7'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers', '~> 4.4', '>= 4.4.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Login managment
gem 'devise', '~> 4.7', '>= 4.7.3'

# Allow resetting the ID of tables to 0
gem 'activerecord-reset-pk-sequence', '~> 0.2.1'

# Hide API keys from bad guys
gem 'dotenv-rails', '~> 2.7', '>= 2.7.6'

# Random data generator
gem "faker", :git => "https://github.com/faker-ruby/faker.git", :branch => "master"

# Mailjet
gem "mailjet", :git => "https://github.com/mailjet/mailjet-gem.git"

# Google Trad
gem "google-cloud"
gem "google-cloud-translate"

# Web Scrapper for Recipes 
gem 'recipe_scraper', '~> 2.2', '>= 2.2.4'

# Table print
gem "table_print"
#################################################################################
# List of added gems :
# gem "devise"
# gem "faker", :git => "https://github.com/faker-ruby/faker.git", :branch => "master"
# gem "rubocop", require: false
# gem "better_errors"
# gem "binding_of_caller"
# gem "solargraph"
# gem "pry"
# gem "dotenv-rails"
# gem "letter_opener"
# gem "rails erd"
# gem "activerecord-reset-pk-sequence"
# gem 'mailjet', :git => 'https://github.com/mailjet/mailjet-gem.git'
# gem "google-cloud"
# gem "google-cloud-translate"
# gem "recipe_scraper"
# gem "table_print"
#################################################################################
