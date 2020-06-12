source 'https://rubygems.org'

ruby '2.5.5'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'pg', '>= 0.18', '< 2.0'
gem "prometheus_exporter", "0.4.16"
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.4', '>= 5.2.4.3'
gem "rails_semantic_logger"
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

group :development, :test do
  gem "better_errors"
  gem "bundler-audit", "0.6.1"
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem "factory_bot_rails"
  gem "pry-rails"
  gem "pry-byebug"
  gem 'rspec-rails'
  gem "rubocop", require: false
end

group :test do
  gem "database_cleaner"
  gem "simplecov", require: false
end

group :development do
  gem "awesome_print"
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
