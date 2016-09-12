RSpec.configure do |config|

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
  end

  config.after(:suite) do
    DatabaseCleaner.clean_with :truncation, except: [ActiveRecord::InternalMetadata.table_name]
  end
end

