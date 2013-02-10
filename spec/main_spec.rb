require 'spec_helper'

def global
  fail 'ran global'
end

def main
  @main ||= TOPLEVEL_BINDING.eval 'self'
end

describe 'on the main object' do

  it 'should stub global functions' do

    #sut = play_doh main
    #p main.
    ##global.should be nil

  end

end