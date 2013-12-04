require 'spec_helper'
require_relative '../lib/mock'

describe 'Main Object' do

  subject { Scope.new('run 42').sut }

  it { should run 42 }

end

class Scope

  attr_reader :sut

  def initialize file
    @sut = Object.new
    eval file
  end

  def method_missing method, *args
    Mock.stub(sut, "#{method}?") { true }
    Mock.stub sut, method
    sut.send method, *args
  end

end