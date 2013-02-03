require 'spec_helper'
require_relative '../lib/playdoh'

describe 'play-doh' do

  it 'could be anything' do

    #old school rr
    x = Object.new
    stub(x).anything
    x.anything.should be nil

    #fresh & cool
    Playdoh.new.anything.should be_a Playdoh
  end

  it 'can be modeled as a class' do

    class Calculator

      def add(x, y)
        x + y
      end

    end

    calc = Playdoh.new Calculator.new
    calc.add(2, 2).should == 4

  end

end