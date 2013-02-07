require 'mock'

def play_doh(sut=Object.new)
  Playdoh.new sut
end

class Playdoh

  def initialize(sut=Object.new)
    @sut = sut
  end

  def method_missing(method, *args)
    given.send method, *args
    @sut.send method, *args
  end

  def given
    Mock.stub @sut
  end

  def when
    @sut
  end

  def verify
    Mock.mock @sut
  end

end