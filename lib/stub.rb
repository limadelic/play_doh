require_relative 'mock'
require_relative 'meta'

module Stub

  include Meta

  def stub(method, value=nil)
    Mock.stub(@sut, method).returns(value)
  end

  def stub_methods
    instance_methods.each { |m| stub m }
    stub_method_missing
  end

  def stub_method_missing
    def @sut.method_missing(method, *args)
      nil
    end

    def @sut.respond_to?(method)
      true
    end
  end

  def stub_dependencies
    @sut.instance_variables.each { |v| stub_dependency v }
  end

  def stub_dependency(name)
    current_value = @sut.instance_variable_get name
    return unless is_dependency? current_value

    stubbed_value = play_doh current_value

    @sut.instance_variable_set name, stubbed_value
    stub method_for_property(name), stubbed_value
  end

end