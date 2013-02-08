require 'mock'

def play_doh(sut=Object.new)
  Playdoh.new sut
end

class Playdoh

  def initialize(sut=Object.new)
    @sut = sut
    stub_all
    default_operation
  end

  def stub_all
    instance_methods.each { |method| Mock.stub @sut, method }
  end

  def instance_methods
    @sut.public_methods(false).map { |m| m.to_sym }
  end

  def operation
    @operation = -> method, *args { yield method, *args }
    self
  end

  def default_operation
    operation { |method, *args| @sut.send method, *args }
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