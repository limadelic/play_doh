require 'mock'

def given(playdoh)
  playdoh.given()
end

class Playdoh

  def initialize(model=Object.new)
    @model = model
    @mock = Mock.new
  end

  def method_missing(method, *args)
    return @model.send method, *args if @model.respond_to? method
    self
  end

  def given()
    @mock.stub(@model)
  end

end