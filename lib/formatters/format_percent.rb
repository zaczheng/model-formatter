require 'rubygems'
require 'action_view'

# Customised: added :flexible_precision i.e. 100.0 will be 100% not 100.0%. 1.5 will be 1.5%
module Formatters
	class FormatPercent < Format
		include ActionView::Helpers::NumberHelper

		def initialize(options = {})
      @precision = options[:precision] || 1
		end

		def from(value, options = {})
		  if options[:flexible_precision] && value.to_i == value
		    @precision = 0
		  end
		  
      options = {:precision => @precision}.merge(options)
		  number_to_percentage value, options
		end

		def to(str, options = {})
			return nil if str.nil? or str.empty?
			str.gsub(/[^0-9\.\-]/, '').to_f
		end
	end
end
