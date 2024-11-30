source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.1.0'
gem 'mini_portile'
gem 'will_paginate'
gem 'sass-rails'
gem 'ffi', '~> 1.9.25'
gem 'rb-inotify'
gem 'uglifier'
gem 'coffee-rails'
gem 'sprockets-rails', :require => 'sprockets/railtie'
gem 'jquery-rails'
gem 'turbolinks'

gem 'jbuilder'
gem 'hirb'
gem 'json'
gem 'sdoc'
gem 'devise'
gem 'devise_token_auth'
gem 'byebug'
gem 'devise-bootstrapped'
gem 'rails_12factor', group: :production
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
#   # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'sqlite3', '~> 1.3.13'
  gem 'rspec-rails', '~> 3.6'
  gem "factory_girl", "2.2.0"
  gem "shoulda-matchers", '~> 3.1'
  gem 'database_cleaner', '< 1.1.0'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  gem 'pg'
end