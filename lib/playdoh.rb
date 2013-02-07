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
    methods = @sut.public_methods.map {|m| m.to_sym} -
        [:methods, :==, :__send__, :__id__, :object_id, :class]

    methods.each { |method| Mock.stub @sut, method }
  end

  def method_missing(method, *args)
    reset method
    #p *args
    #@sut.add *args

    @sut.eval send :add, *args
  end

  def reset(method)
    return unless @on_when
    p method
    RR::Space.instance.reset_double @sut, method
    @on_when = false
  end

  def given
    Mock.stub @sut
  end

  def when
    @on_when = true
    self
  end

  def verify
    Mock.mock @sut
  end

end