require 'spec_helper'

describe 'on an object' do

  let(:calc) { play_doh Calculator.new }

  it 'should stub all by default' do

    calc.add(2, 2).should be nil

  end

  it 'should execute the desired method' do

    calc.when.add(2, 2).should == 4

  end

  it 'should allow to verify' do

    calc.verify.add 3, 0.14
    calc.when.pi

  end

  it 'should allow to setup' do

    calc.given.add { 42 }
    calc.when.pi.should == 42

  end

  it 'should partial mock' do

    calc.when.pi.should be nil

  end

end