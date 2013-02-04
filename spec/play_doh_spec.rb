require_relative '../lib/playdoh'

class Calculator

  def add(x, y)
    x + y
  end

end

describe 'play-doh' do

  subject { play_doh Calculator.new }

  it 'stubs all by default' do

    subject.add(2, 2).should be_a Playdoh

  end

  it 'executes the exercise method' do

    subject.when.add(2, 2).should == 4

  end

  it 'allows to setup' do

    subject.given.add { 42 }
    subject.when.add(2, 2).should == 42

  end

  it 'allows to verify' do

    subject.add 2, 2
    subject.then.add 2, 2

  end

end