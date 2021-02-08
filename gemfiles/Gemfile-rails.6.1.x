source "https://rubygems.org"

gemspec path: "../vite_rails"

gem "rails", "~> 6.1.0"
gem "rake", ">= 11.1"
gem "rack-proxy", require: false
gem "minitest", "~> 5.0"
gem "pry-byebug"
gem "simplecov", '< 0.18'

group :test do
  gem "m"
end
