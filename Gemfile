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
gem 'turbolinks', '~> 5'
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
  gem "pry"
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Intellisense & much more
  gem "solargraph"
  # Better errors replace standard Rails error page
  gem "better_errors"
  gem "binding_of_caller"
  # Ruby static analyzer and code formatter
  gem "rubocop", require: false
  # Preview email in browser
  gem "letter_opener"
  # Generate Diagram
  gem "rails-erd"
  # Table print
  gem "table_print"
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Login managment
gem "devise"

# Allow resetting the ID of tables to 0
gem "activerecord-reset-pk-sequence"

# Hide API keys from bad guys
gem "dotenv-rails"

# Random data generator
gem "faker", :git => "https://github.com/faker-ruby/faker.git", :branch => "master"

# Mailjet
gem "mailjet", :git => "https://github.com/mailjet/mailjet-gem.git"

# Admin panel
gem "rails_admin", "~> 2.0"

# Google Trad
gem "google-cloud"
gem "google-cloud-translate"

# Rest Client for REST Api calls
gem "rest-client", "~> 2.1"

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
# gem "rails_admin"
# gem "activerecord-reset-pk-sequence"
# gem "table_print"
# gem 'mailjet', :git => 'https://github.com/mailjet/mailjet-gem.git'
# gem "google-cloud"
# gem "google-cloud-translate"
# gem "rest-client", "~> 2.1"
#################################################################################
