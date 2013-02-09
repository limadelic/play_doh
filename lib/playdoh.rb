require 'mock'

def play_doh(sut=nil)
  Playdoh.new sut
end

class Playdoh

  def initialize(sut=nil)
    @sut = sut || Object.new
    stub_methods
    default_operation
  end

  def stub_methods
    instance_methods.each do |method|
      stub_property method or
      stub method
    end
  end

  def stub_property(name)
    return unless is_property? name
    stub name, play_doh
  end

  def stub(method, value=nil)
    Mock.stub(@sut, method).returns(value)
  end

  def is_property?(name)
    @sut.method(name).parameters.empty?
  end

  def instance_methods
    @sut.public_methods(false).map { |m| m.to_sym }
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