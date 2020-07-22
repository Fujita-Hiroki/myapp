source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.0'

gem 'rails', '~> 6.0.0'
gem 'mysql2', '>= 0.4.4'
gem 'puma', '~> 4.3.5'
gem 'sassc-rails', '>= 2.1.0'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'bcrypt', '~> 3.1.7'
gem 'rails-i18n', '~> 6.0.0'
gem 'i18n', '~> 1.8.3'
gem 'faker'
gem 'kaminari'
gem 'kaminari-bootstrap'
gem 'bootsnap', '>= 1.4.2', require: false
gem "aws-sdk-s3", require: false
gem 'mini_magick'
gem 'data-confirm-modal'
gem 'image_processing', '~> 1.11.0'
gem 'dotenv-rails'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rubocop', require: false
  gem 'rubocop-rails'
  gem 'rspec-rails', '~> 4.0.0.beta2'
  gem "factory_bot_rails"
  # 下記のgemは本当は導入したくないが、reset_tokenが仮属性のためspec内でletできないため導入
  gem 'rails-controller-testing'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
