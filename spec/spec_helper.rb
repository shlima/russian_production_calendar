# frozen_string_literal: true

require 'bundler/setup'
require 'pry'
require 'russian_production_calendar'
require 'russian_production_calendar/ext/date'

RSpec.configure do |config|
  config.example_status_persistence_file_path = '.rspec_status'
  config.disable_monkey_patching!
  config.filter_run :focus
  config.run_all_when_everything_filtered = true
  config.order = :random
  Kernel.srand config.seed

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
