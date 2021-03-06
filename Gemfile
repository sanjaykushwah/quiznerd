source 'https://rubygems.org'

ruby '2.2.4'

gem 'rails', '~> 4.2.1' 
gem 'sass-rails', '~> 4.0.3'
gem 'puma'
gem 'bootstrap-sass', '~> 3.1.1.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'simple_form', '~> 3.1.0'
gem 'faker', '1.3.0'
gem 'will_paginate', github: 'mislav/will_paginate'
gem 'will_paginate-bootstrap'
gem 'redcarpet', '3.1.2'
gem 'devise', '~> 3.4.0' 
gem 'devise-token_authenticatable', '~> 0.3.0'
gem 'pg', '0.15.1'
gem 'pg_search', '0.7.9'
gem 'active_model_serializers'
gem 'redis-rails', '~> 4.0.0'

# temporarily add to all environments. Later, will remove from production
gem 'rack-mini-profiler'
gem 'sdoc', '~> 0.4.0',          group: :doc

group :development, :test do
  gem 'spring'
  gem 'rspec-rails', '~> 3.3.3'
  gem 'childprocess', '0.3.6'
  gem 'hirb'
  gem 'awesome_print'
  gem 'pry'
  gem 'pry-byebug'
  gem 'orderly'
  gem 'rubocop', '~> 0.29.1'
  gem 'mock_redis'

  # In Rails 4.1, we have secrets.yml which kind of does the same thing as 
  # figaro, except figaro helps automatically set up the variables in your 
  # environment (incl Heroku), so it's still beneficial.
  gem "figaro"

end

group :test do
  gem 'simplecov', :require => false
  gem 'selenium-webdriver'
  gem 'capybara'
  gem 'capybara-webkit'
  gem "launchy"
  gem 'factory_girl_rails'
  gem 'database_cleaner', github: 'bmabey/database_cleaner'
  # Uncomment this line on OS X.
  gem 'growl', '1.0.3'
  # Uncomment these lines on Linux.
  # gem 'libnotify', '0.8.0'
  # Uncomment these lines on Windows.
  # gem 'rb-notifu', '0.0.4'
  # gem 'win32console', '1.3.2'
  # gem 'wdm', '0.1.0'
  gem 'rake'
end

group :production do
 	gem 'rails_12factor', '0.0.2'
end

