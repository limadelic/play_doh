def play_doh(sut=nil)
  return sut if sut.is_a? Playdoh
  Playdoh.new sut
end

require_relative 'mock'
require_relative 'stub'

class Playdoh

  include Stub

  def initialize(sut=nil)
    @sut = sut || Object.new
    stub_methods
    stub_dependencies
    default_operation
  end

  def operation
    @operation = -> method, *args { yield method, *args }
    self
  end

  def default_operation
    operation do |method, *args|
      @sut.send method, *args
    end
  end

  def method_missing(method, *args)
    @operation.call method, *args
  ensure
    default_operation
  end

  def reset(method)
    Mock.reset @sut, method
  end

  def given
    Mock.stub @sut
  end

  def when
    operation do |method, *args|
      reset method
      @sut.send method, *args
    end
  end

  def verify
    Mock.mock @sut
  end

end