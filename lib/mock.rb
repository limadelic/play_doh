require 'rr'

module Mock

  extend RR::Adapters::RRMethods

  def self.reset(sut, method)
    RR::Space.instance.reset_double sut, method
  end

end
