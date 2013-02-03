class Playdoh

  def initialize(model=Object.new)
    @model = model
  end

  def method_missing(method, *args)
    return @model.send method, *args if @model.respond_to? method
    self
  end

end