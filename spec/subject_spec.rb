require 'spec_helper'

describe 'spying the subject' do

  subject { Object.new }

  it 'stuff' do
    given.x { 42 }
    subject.x.should == 42
    expect_to have_received.x
  end

end