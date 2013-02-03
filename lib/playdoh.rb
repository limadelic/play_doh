require 'mock'

def given(playdoh)
  playdoh.given()
end

class Playdoh

  def initialize(model=Object.new)
    @model = model
  end

  def method_missing(method, *args)
    return @model.send method, *args if @model.respond_to? method
    self
  end

  def given()
    Mock.stub @model
  end

end