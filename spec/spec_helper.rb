# frozen_string_literal: true

$ROOT_PATH = File.expand_path('../../', __FILE__).freeze

require 'bundler/setup'
require 'pry'
require 'russian_production_calendar/ext/date'

Dir[File.join($ROOT_PATH, 'spec', 'support', '*.rb')].each { |f| require f }

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
