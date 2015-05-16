$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'rspec/validator_spec_helper'

Dir['./spec/support/**/*.rb'].each { |f| require f }

RSpec.configure do |config|
  config.include RSpec::ValidatorSpecHelper, type: :validator
end
