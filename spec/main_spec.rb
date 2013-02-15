require 'spec_helper'

def main
  @main ||= TOPLEVEL_BINDING.eval 'self'
end

def root_dir
  File.join(File.dirname(__FILE__), '..')
end

def load_file(name)
  load "#{root_dir}/spec/fixtures/#{name}.rb"
end


describe 'on the main object' do

  subject { play_doh main }

  after :each do
    load_file 'main'
  end

  it 'should stub global functions' do

    play_doh main
    load_file 'main'

  end

  it 'should mock global functions' do

    subject.verify.global

  end

  it 'should allow to stub' do

    subject.given.global

  end

  it 'should execute global' do

    subject.given.global_with_block.yields
    subject.verify.ran_global

  end

end