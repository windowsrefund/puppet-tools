Puppet::Parser::Functions::newfunction(
  :has_template, 
  :type => :rvalue,
  :doc => "Returns the first arg which translates to a valid template.") do |args|

	require 'rubygems'
  require 'puppet'

  args.delete_if { |a| Puppet::Parser::Files.find_template(a).nil? }

  raise Puppet::ParseError, "No valid template found." if args.empty? 
  function_template args.first
  
end

