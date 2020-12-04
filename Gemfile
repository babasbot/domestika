source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.2'

gem 'bcrypt', '~> 3.1', '>= 3.1.16'
gem 'decent_exposure', '~> 3.0', '>= 3.0.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.3', '>= 6.0.3.4'
gem 'sass-rails', '>= 6'
gem 'turbolinks', '~> 5'
gem 'webpacker', '~> 4.0'

gem 'bootsnap', '>= 1.4.2', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.1'
  gem 'faker', '~> 2.15', '>= 2.15.1'
  gem 'rspec-rails', '~> 4.0', '>= 4.0.1'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'shoulda-matchers', '~> 4.4', '>= 4.4.1'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
