require 'coveralls'
Coveralls.wear!('rails')

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rspec/rails'
require 'email_spec'
require 'rspec/autorun'

RSpec.configure do |config|
  config.include EmailSpec::Helpers
  config.include EmailSpec::Matchers
  config.include Devise::TestHelpers, type: :controller
  config.include FactoryGirl::Syntax::Methods

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # If true, the base class of anonymous controllers will be inferred
  # automatically. This will be the default behavior in future versions of
  # rspec-rails.
  config.infer_base_class_for_anonymous_controllers = false

  # Run specs in random order to surface order dependencies. If you find an
  # order dependency and want to debug it, you can fix the order by providing
  # the seed, which is printed after each run.
  #     --seed 1234
  config.order = 'random'

  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    begin
      # Run FactoryGirl's lint, which creates every factory, then calls #valid?
      # on each. This creates a bunch of records. This is basically a test unto
      # itself.
      DatabaseCleaner.start
      FactoryGirl.lint
    ensure
      # So make sure we clean out those records before running the actual test
      # suite
      DatabaseCleaner.clean
    end
  end

  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
end
