require 'capybara/rspec'
require 'factory_girl_rails'
require 'support/factory_girl'
require 'database_cleaner'
require 'support/database_cleaner'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
end
