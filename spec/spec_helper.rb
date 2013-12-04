require 'rspec'
require 'rr'

module RR::Adapters
  module RSpec2
    include RRMethods
    def setup_mocks_for_rspec; RR.reset end
    def verify_mocks_for_rspec; RR.verify end
    def teardown_mocks_for_rspec; RR.reset end
    def have_received(method = nil)
      RR::Adapters::Rspec::InvocationMatcher.new(method)
    end
  end
end

module RSpec::Core::MockFrameworkAdapter; include RR::Adapters::RSpec2 end

RSpec.configure do |c|
  c.mock_framework = :rr
  c.alias_it_should_behave_like_to :containing, 'containing'
  c.backtrace_exclusion_patterns.push RR::Errors::BACKTRACE_IDENTIFIER
end

def main; TOPLEVEL_BINDING.eval 'self' end
def given sut=subject; stub sut end
def expect_to expectation; expect(subject).to expectation end

def root_dir; File.join(File.dirname(__FILE__), '..') end
Dir["#{root_dir}/spec/fixtures/**/*.rb"].each {|f| require f }

require_relative '../lib/play_doh'
