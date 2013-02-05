require_relative '../lib/playdoh'

class Calculator

  def add(x, y)
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

    calc.add 2, 2
    #calc.then add 2, 2
    calc.then.add 2, 4

  end

end