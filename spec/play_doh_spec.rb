require 'spec_helper'

describe 'play-doh' do

  it 'is like a stub' do
    x = Object.new
    stub(x).anything
    x.anything.should be nil
  end

end