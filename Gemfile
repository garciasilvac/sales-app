source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3'
# Use postgres as the database for Active Record
gem 'pg'
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

gem 'jquery-rails'

gem 'popper_js'

gem 'rails-i18n'

gem 'amazing_print'

gem 'font-awesome-sass', '~> 5.12.0'

gem "rack-timeout"

gem "pg_search"

gem "simple_form"

gem 'moment-timezone-rails'
gem 'momentjs-rails'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17', '>= 4.17.47'

#### USER MANAGEMENT ########
gem 'devise', '>= 4.7.1'

gem 'rails_admin', git: 'https://github.com/sferik/rails_admin.git'

gem 'cancancan'

#######  IMAGE COMPRESSION  #################

gem 'mini_magick'

##### MAILER ################

gem 'dotenv-rails'

###### GEOCODER

gem 'activerecord-postgis-adapter', '~> 6.0'

gem 'rgeo', '~> 2.1', '>= 2.1.1'

gem 'geocoder', '~> 1.3', '>= 1.3.7'



##############################






group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end
group :test, :production do
  # Adds support for Capybara system testing and selenium driver
  gem 'uglifier'
  gem 'google-cloud-storage'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
