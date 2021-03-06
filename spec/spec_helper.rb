# Require simplecov before 
RSpec.configure do |config|
  require 'parliament/utils/test_helpers/simplecov_helper'
  Parliament::Utils::TestHelpers::SimpleCovHelper.load_rspec_config(config)
end

require File.expand_path('../dummy/config/environment.rb', __FILE__)

# Application Files
require 'parliament'
require 'parliament/ntriple'
require 'bandiera/client'
require 'parliament/grom/decorator'
require 'rspec/rails'

Bundler.require(*Rails.groups)

# Load RSpec configurations held within all test helper modules included in the
# overarching Parliament::Utils::TestHelpers module
RSpec.configure do |config|
  Parliament::Utils::TestHelpers.included_modules.each do |m|
    m.load_rspec_config(config) unless m == Parliament::Utils::TestHelpers::SimpleCovHelper
  end
end
