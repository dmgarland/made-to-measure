require "bundler/setup"
require 'webmock/rspec'
require 'pry'
require "made_to_measure"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def user_agent_regexp
  /MadeToMeasure\/[\d]*.[\d]*.[\d]*\s\(\+https:\/\/github.com\/dmgarland\/made-to-measure\)/
end
