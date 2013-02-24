require 'spec_helper'

def main
  @main ||= TOPLEVEL_BINDING.eval 'self'
end

def main.global; end
def main.global_with_block; end
def main.ran_global; end

describe 'on the main object' do

  subject { play_doh main }

  after { load_file 'main' }

  it 'should mock global functions' do

    subject.verify.global

  end

  it 'should allow to stub' do

    subject.given.global { 42 }
    subject.global.should == 42

  end

  it 'should execute global' do

    subject.given.global_with_block.yields
    subject.verify.ran_global

  end

end