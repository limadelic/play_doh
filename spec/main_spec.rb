require 'spec_helper'

describe 'on the main object' do

  subject { play_doh main }

  it 'should stub global functions' do

    subject.global.should be nil

  end

  it 'should allow to stub' do

    subject.given.global { 42 }
    subject.global.should == 42

  end

  it 'should execute global' do

    expect { subject.when.global }.
      to raise_error 'ran global'

  end

end