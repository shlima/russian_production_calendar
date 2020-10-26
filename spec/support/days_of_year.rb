helper = Module.new do
  # @return [Array]
  def days_of_year(year)
    Range.new(Date.new(year, 1, 1), Date.new(year, 12, 31)).to_a
  end
end

RSpec.configure do |config|
  config.include helper
end
