Puppet::Type.newtype(:slot) do
  desc "The attributes to go with an edge, connecting two applications.  The attribute names are the names in the source resource, and the values are the names in the target."

  newparam(:name) {}

  def self.valid_parameter?(name)
    true
  end

  # Override how parameters are handled so that we support the extra
  # parameters that are used with defined resource types.
  def [](param)
    return super if self.class.validattr?(param)
    @extra_parameters[param.to_sym]
  end

  # Override how parameters are handled so that we support the extra
  # parameters that are used with defined resource types.
  def []=(param, value)
    return super if self.class.validattr?(param)
    @extra_parameters[param.to_sym] = value
  end

  def initialize(*args)
    @extra_parameters = {}
    super(*args)
  end
end
