require 'webmock/rspec'
require 'brewerydb'
RSpec.configure do |config|
  Brewerydb.configure { |c| c.api_key = 'abc123' }
end