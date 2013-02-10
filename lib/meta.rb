module Meta

  DATA_TYPES = [
    String, Symbol, Regexp,
    Float, Fixnum, Bignum,
    TrueClass, FalseClass,
    Array, Hash,
    Exception
  ]

  def instance_methods
    @sut.public_methods(false)
    .reject { |m| is_property? m }
    .map &:to_sym
  end

  def is_dependency?(object)
    not DATA_TYPES.include? object.class
  end

  def is_property?(name)
    @sut.instance_variables.
      include? property_for_method name
  end

  def property_for_method(name)
    "@#{name.to_s}".to_sym
  end

  def method_for_property(name)
    name.to_s[1..-1].to_sym
  end

end