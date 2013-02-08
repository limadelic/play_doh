require_relative '../lib/playdoh'
require 'spec_helper'

describe 'play-doh' do

  let(:calc) { play_doh Calculator.new }
  subject { calc }

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

  it 'should behave as auto-mock container' do

    calc.screen.verify.on
    calc.when.turn_on

  end

end