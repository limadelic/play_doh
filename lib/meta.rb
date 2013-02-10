module Meta

  def instance_methods
    @sut.public_methods(false)
    .reject { |m| is_property? m }
    .map &:to_sym
  end

  def is_property?(name)
    @sut.instance_variables.include? property name
  end

  def property(name)
    name.to_s.gsub(':', ':@').to_sym
  end

end