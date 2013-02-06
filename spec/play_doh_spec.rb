require_relative '../lib/playdoh'
require 'spec_helper'

class Calculator

  def add(x, y)
    p 'gonna add'
    x + y
  end

end

describe 'play-doh' do

  let(:calc) { play_doh Calculator.new }

  it 'stubs all by default' do

    calc.add(2, 2).should be_a Playdoh

  end

  it 'executes the exercise method' do

    calc.when.add(2, 2).should == 4

  end

  it 'allows to setup' do

    calc.given.add { 42 }
    calc.when.add(2, 2).should == 42

  end

  it 'allows to verify' do

    sut = Calculator.new
    #calc = play_doh sut
    stub(sut).add 2, 2#.send :add, 2, 2
    sut.send :add, 2, 2
    #calc.add 2, 2
    sut.should have_received.add 2, 2

  end

end