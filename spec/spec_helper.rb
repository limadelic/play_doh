require 'rr'
require 'rspec'

RSpec.configure do |c|
  c.mock_framework = :rr
  c.alias_it_should_behave_like_to :containing, 'containing'
end

def root_dir
  File.join(File.dirname(__FILE__), '..')
end

Dir["#{root_dir}/spec/support/**/*.rb"].each {|f| require f }

require_relative '../lib/playdoh'
