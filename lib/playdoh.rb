require 'mock'

def play_doh(sut=Object.new)
  Playdoh.new sut
end

class Playdoh

  def initialize(sut=Object.new)
    @sut = sut
    stub_all
  end

  def stub_all
    instance_methods.each { |method| Mock.stub @sut, method }
  end

  def instance_methods
    @sut.public_methods(false).map { |m| m.to_sym }
  end

  def method_missing(method, *args)
    return reset method if @allowing
    reset method if @executing
    @sut.send method, *args
  end

  def reset(method)
    Mock.reset @sut, method
    @executing = @allowing = false
  end

  def given
    Mock.stub @sut
  end

  def when
    @executing = true
    self
  end

  def allow
    @allowing = true
    self
  end

  def verify
    Mock.mock @sut
  end

end