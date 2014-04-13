source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.1.0'

gem 'sass-rails', '~> 4.0.3'
gem 'therubyracer', :platform=>:ruby
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'bootstrap-sass'

gem 'sqlite3'
gem 'jbuilder', '~> 2.0'
gem 'devise'
gem 'devise_invitable'
gem 'pundit'
gem 'simple_form'
gem 'slim-rails'
gem 'annotate', "~> 2.6.3"

group :production do
  gem 'unicorn'
end

group :development do
  gem 'spring'
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :mri_21, :rbx]
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
  gem "letter_opener"
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'jazz_hands'
  gem 'rspec-rails'
  gem 'thin'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
  gem 'coveralls', require: false
end

gem 'brakeman'
gem 'sdoc', '~> 0.4.0', require: false
gem 'inch', require: false
gem 'rails_best_practices', require: false
gem 'rubocop', require: false
gem 'reek', require: false
