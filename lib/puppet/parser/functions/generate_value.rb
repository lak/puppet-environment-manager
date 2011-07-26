Puppet::Parser::Functions.newfunction(:generate_value, :type => :rvalue) do |arg|
  "generated_value_#{resource.ref}: #{arg}"
end
