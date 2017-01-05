source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.0'
# Use mysql2 as the database for Active Record
gem 'mysql2', '~> 0.3.18'
# Use SCSS for stylesheets
#gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
gem 'jquery-turbolinks'
gem 'turbolinks-redirect'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

gem 'haml'

gem "bcrypt-ruby", :require => "bcrypt"

gem 'ranked-model'

gem 'rake', '10.4.2'
#gem 'rake', '11.3.0'

gem 'petrovich', '~> 1.0'

gem 'simple_captcha2', require: 'simple_captcha'

gem 'ipgeobase', :git => 'https://github.com/mokevnin/ipgeobase'

#Haml-rails
gem "haml-rails", "~> 0.8"
gem 'meta-tags', :require => 'meta_tags'

gem 'bootstrap-sass', '~> 3.3.5'
gem 'sass-rails', '>= 3.2'
gem 'font-awesome-sass'
gem "font-awesome-rails"

gem 'carrierwave'
gem 'rmagick', :require => false
gem 'mini_magick'

#source 'https://rails-assets.org/' do 
#  gem 'rails-assets-adminlte'
#end

gem 'devise'
gem 'devise_lastseenable'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-vkontakte'
#gem 'omniauth-mailru'
gem 'omniauth-mail_ru'
#gem 'omniauth-gplus'
gem "omniauth-google-oauth2"


gem 'russian', '~> 0.6.0'
gem 'kaminari'

gem 'wicked_pdf'
gem 'wkhtmltopdf-binary'
gem 'ru_propisju'

gem 'translit'

gem 'rucaptcha'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :production do
  gem 'unicorn', '~> 3.6.2', :require => nil
end

group :development do
  gem 'capistrano-deploy', '~> 0.1.1', :require => nil
end

group :development do
  gem "capistrano"
  gem "rvm-capistrano",  require: false
end

gem "therubyracer"