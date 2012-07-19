require 'database_cleaner'
require 'mongoid'
require 'mongoid-rspec'
require 'mongoid_token'
require 'mongoid/token/exceptions'

RSpec.configure do |config|
  config.include Mongoid::Matchers
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
  end

  config.after(:each) do
    Mongoid::Sessions.default.collections.each do |c|
      c.indexes.drop
    end

    DatabaseCleaner.clean
  end
end

Mongoid.load!("mongoid.yml")
