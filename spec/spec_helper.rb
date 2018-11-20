# frozen_string_literal: true

require 'simplecov'
require 'simplecov-console'
require 'coveralls'
Coveralls.wear!

RSpec.configure do |config|
  config.before(:suite) do
    Rails.application.load_seed # loading seeds
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
                                                                 SimpleCov::Formatter::Console
                                                               ])
SimpleCov.start
