# Require in our testing gems/libraries
require 'rubygems'
require 'bundler/setup'
require 'active_support/all'
require 'active_record'
require 'factory_girl'
require 'faker'
require 'database_cleaner'

# Todo: require in DB connector

# Todo: require in our models


# Recreate the database
ActiveRecord::Migration.suppress_messages do
  require './db/schema.rb'
end

RSpec.configure do |config|
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
end

I18n.enforce_available_locales = false