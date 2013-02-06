require 'rr'
require 'rspec'

RSpec.configure do |c|
  c.mock_framework = :rr
  c.alias_it_should_behave_like_to :containing, 'containing'
  c.backtrace_clean_patterns.push RR::Errors::BACKTRACE_IDENTIFIER
end