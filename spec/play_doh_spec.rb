require 'spec_helper'

describe 'play-doh' do

  it 'is like a stub' do

    #old school rr
    x = Object.new
    stub(x).anything
    x.anything.should be nil

    #fresh & cool
    Playdoh.new.anything.should be_a Playdoh
  end

end