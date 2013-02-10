require_relative 'mock'
require_relative 'meta'

module Stub

  include Meta

  def stub(method, value=nil)
    Mock.stub(@sut, method).returns(value)
  end

  def stub_methods
    instance_methods.each { |m| stub m }
  end

  def stub_dependencies
    @sut.instance_variables.each { |v| stub_dependency v }
  end

  def stub_dependency(name)
    value = play_doh @sut.instance_variable_get name
    @sut.instance_variable_set name, value
    stub method_for_property(name), value
  end

end