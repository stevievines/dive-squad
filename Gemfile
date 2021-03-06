source 'https://rubygems.org'
ruby "2.1.7"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'

# Use postgres as the database for Active Record
gem 'pg'

# Use SCSS for stylesheets
gem 'bootstrap-sass'
gem 'sass-rails', '~> 5.0'

# https://github.com/jordanbrock/bootstrap-daterangepicker-rails
gem 'bootstrap-daterangepicker-rails'

# use chartkick for charting
gem 'chartkick'

# Fontawesome gem
gem 'font-awesome-sass'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.1.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Moment.js for time
gem 'momentjs-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '~> 2.3.0'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use OmniAuth for Google Drive Integration
gem 'omniauth', '~> 1.2.2'
gem 'omniauth-google-oauth2'
gem 'httparty'

group :production do
  gem 'rails_12factor'
end

group :development, :test do
  # pry for debugging
  gem 'pry'
  gem 'pry-remote'
  gem 'pry-byebug'

  # Use RSPEC for testing
  gem 'rspec-rails', '~> 3.0'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  # dot-env for sensitive environment variables
  gem 'dotenv-rails'

  gem 'factory_girl_rails'
end

group :test do
  gem 'simplecov'
  gem 'timecop'
end
