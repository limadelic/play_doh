require 'spec_helper'

describe 'as auto-mock container' do

  let(:calc) { play_doh Calculator.new }

  it 'should auto-stub dependencies' do

    calc.when.turn_on.should be nil

  end

  it 'should spy on dependencies' do

    calc.screen.verify.on
    calc.when.turn_on

  end

  it 'should allow to stub dependencies' do

    calc.screen.given.on { true }
    calc.when.turn_on.should be true

  end

  it 'should not mess up with data types' do

    calc.serial.should == 'XXX'

  end

end