require 'puppet/face'

Puppet::Face.define(:environment, '0.0.1') do
  copyright "Puppet Labs", 2011
  license   "Apache 2 license; see COPYING"

  summary "Manage Puppet environments."

  description <<-EOT
    This is a prototype tool for managing cross-node applications within an environment.
  EOT

  action :compile do
    when_invoked do |name|
      unless catalog = Puppet::Face[:catalog, "current"].find(name)
        raise "Could not find catalog for environment #{name}"
      end
    end
  end
end
